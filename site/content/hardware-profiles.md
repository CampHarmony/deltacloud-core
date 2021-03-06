---
site_name: Deltacloud API
title: Hardware profiles
---
<br/>

<div class="row">
  <div class="span9">

<h3 id="hardware">Hardware profiles</h3>

<p>
A hardware profile describes the size of a virtual machine in a cloud and specifies details such as how many virtual CPUs, how much memory or how much local storage an instance might have. The attributes of a hardware profile consist of a human-readable <strong>name</strong> and a list of <strong>elements</strong>. Each element defines possible values along with a sizing dimension.
</p>

<p>
Since clouds differ sharply in how virtual machine sizing is represented and influenced, hardware profiles provide a generic mechanism to express sizing constraints. For each dimension (such as amount of memory), the hardware profile can express that
</p>

<ul>
  <li>size is <strong>fixed</strong> in the dimension, for example instances all have 2GB of memory;</li>
  <li>size can vary within some <strong>range</strong>, for example instances can have from 1GB to 4GB of memory;
  </li>
  <li>
  size can be chosen from a predefined set of values - an <strong>enumeration</strong>, for example instances can have 512 MB, 1 GB or 4GB of memory.
  </li>
</ul>

<p>
When creating a new instance, a client must specify the hardware profile on which the instance is based.
</p>

<p style="margin-bottom:0px">
In addition to the sizing constraints, a hardware profile may also indicate the parameters that can be specified by a client in instance operations. A <code>&lt;param&gt;</code> XML tag signifies the user-defined variable dimensions within the given property. For instance, the following extract shows the memory dimension for a hardware profile that can be specified in the HTTP POST create 
</p>

  </div>
  <div class="span3">

<ul class="nav nav-list well">
  <li class="nav-header">
    REST API
  </li>
  <li><a href="/rest-api.html">Introduction</a></li>
  <li><a href="/api-entry-point.html">API entry point</a></li>
  <li><a href="/compute-resources.html">Compute resources</a></li>
  <ul class="nav nav-list">
    <li><a href="/compute-resources.html#realms">Realms</a></li>
    <li class="active"><a href="#hardware">Hardware profiles</a></li>
    <li><a href="/images.html">Images</a></li>
    <li><a href="/instance-states.html">Instance states</a></li>
    <li><a href="/instances.html">Instances</a></li>
    <li><a href="/keys.html">Keys</a></li>
    <li><a href="/firewalls.html">Firewalls</a></li>
    <li><a href="/addresses.html">Addresses</a></li>
    <li><a href="/load-balancers.html">Load balancers</a></li>
  </ul>
  <li><a href="/storage-resources.html">Storage resources</a></li>
</ul>

  </div>
</div>

<p style="margin-top:0px">
operation of the instances collection (i.e. creating a new instance). The given parameter must be specified using the name <strong>hwp_memory</strong>. The default value is 10240 but the client may specify a value in the range 7680 up to 15360:
</p>

<pre>
...
&lt;property kind='range' name='memory' unit='MB' value='10240'&gt;
    &lt;param href='http://localhost:3003/api/instances' method='post' name='hwp_memory' operation='create' /&gt;
    &lt;range first='7680.0' last='15360' /&gt;
&lt;/property&gt;
...
</pre>

<h4>Get a list of all hardware profiles</h4>

<p>
To produce a list of all hardware profiles availaible with this cloud use call <strong>GET /api/hardware_profiles</strong>. The example below shows how to list the hardware profiles available in the Amazon EC2 cloud. As EC2 provides a set of pre-defined hardware profiles, the properties of each dimension (memory,cpu etc) are the type fixed.
</p>

<p>Example request:</p>

<pre>
GET /api/hardware_profiles?format=xml HTTP/1.1
Authorization: Basic AU1J3UB2121Afd1DdyQWxLaTYTmJMNF4zTXBoRGdhMDh2RUw5ZDAN9zVXVa==
User-Agent: curl/7.20.1 (i386-redhat-linux-gnu)
Host: localhost:3001
Accept: */*
</pre>

<p>Server response:</p>

<pre>
HTTP/1.1 200 OK
Content-Type: application/xml
Content-Length: 3896
&lt;?xml version='1.0' encoding='utf-8' ?&gt;
&lt;hardware_profiles&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/t1.micro' id='t1.micro'&gt;
    &lt;name&gt;t1.micro&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='1' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='645.12' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='i386' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='160' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/m1.small' id='m1.small'&gt;
    &lt;name&gt;m1.small&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='1' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='1740.8' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='i386' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='160' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/m1.large' id='m1.large'&gt;
    &lt;name&gt;m1.large&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='4' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='7680.0' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='850' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/m1.xlarge' id='m1.xlarge'&gt;
    &lt;name&gt;m1.xlarge&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='8' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='15360' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='1690' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/c1.medium' id='c1.medium'&gt;
    &lt;name&gt;c1.medium&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='5' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='1740.8' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='i386' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='350' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/c1.xlarge' id='c1.xlarge'&gt;
    &lt;name&gt;c1.xlarge&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='20' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='7168' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='1690' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/m2.xlarge' id='m2.xlarge'&gt;
    &lt;name&gt;m2.xlarge&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='6.5' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='17510.4' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='420' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/m2.2xlarge' id='m2.2xlarge'&gt;
    &lt;name&gt;m2.2xlarge&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='13' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='35020.8' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='850' /&gt;
  &lt;/hardware_profile&gt;
  &lt;hardware_profile href='http://localhost:3001/api/hardware_profiles/m2.4xlarge' id='m2.4xlarge'&gt;
    &lt;name&gt;m2.4xlarge&lt;/name&gt;
    &lt;property kind='fixed' name='cpu' unit='count' value='26' /&gt;
    &lt;property kind='fixed' name='memory' unit='MB' value='70041.6' /&gt;
    &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
    &lt;property kind='fixed' name='storage' unit='GB' value='1690' /&gt;
  &lt;/hardware_profile&gt;
&lt;/hardware_profiles&gt;
</pre>

<h4>Get the details of a hardware profile</h4>

<p>
To retrieve the details of a specific hardware profile use call <strong>GET /api/hardware profiles/:id</strong>. The example below shows a request for the m1-large profile of the Deltacloud mock driver. This hardware profile demonstrates the three different types of parameters (fixed, range, enum). Instances launched within this hardware profile will have exactly 2 virtual CPUs, memory in the range 7.5 to 15GB and local storage that can either be 850MB or 1GB. The default value for each dimension is indicated by the value attribute on the property element.
</p>

<p>Example request:</p>

<pre>
GET /api/hardware_profiles/m1-large?format=xml HTTP/1.1
Authorization: Basic bW9ja3VzZXI6bW9ja3Bhc3N3b3Jk
User-Agent: curl/7.20.1 (i386-redhat-linux-gnu)
Host: localhost:3003
Accept: */*
</pre>

<p>Server response:</p>

<pre>
HTTP/1.1 200 OK
Content-Type: application/xml
Content-Length: 808

&lt;?xml version='1.0' encoding='utf-8' ?&gt;
&lt;hardware_profile href='http://localhost:3003/api/hardware_profiles/m1-large' id='m1-large'&gt;
  &lt;name&gt;m1-large&lt;/name&gt;
  &lt;property kind='fixed' name='cpu' unit='count' value='2' /&gt;
  &lt;property kind='range' name='memory' unit='MB' value='10240'&gt;
    &lt;param href='http://localhost:3003/api/instances' method='post' name='hwp_memory' operation='create' /&gt;
    &lt;range first='7680.0' last='15360' /&gt;
  &lt;/property&gt;
  &lt;property kind='enum' name='storage' unit='GB' value='850'&gt;
    &lt;param href='http://localhost:3003/api/instances' method='post' name='hwp_storage' operation='create' /&gt;
    &lt;enum&gt;
      &lt;entry value='850' /&gt;
      &lt;entry value='1024' /&gt;
    &lt;/enum&gt;
  &lt;/property&gt;
  &lt;property kind='fixed' name='architecture' unit='label' value='x86_64' /&gt;
&lt;/hardware_profile&gt;
</pre>

<a class="btn btn-inverse btn-large" style="float: right" href="/images.html">Images <i class="icon-arrow-right icon-white" style="vertical-align:baseline"> </i></a>

<br/>

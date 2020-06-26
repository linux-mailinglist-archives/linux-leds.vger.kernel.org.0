Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC48820B210
	for <lists+linux-leds@lfdr.de>; Fri, 26 Jun 2020 15:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgFZNFF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 26 Jun 2020 09:05:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29200 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgFZNFF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Jun 2020 09:05:05 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05QD2jfP043371;
        Fri, 26 Jun 2020 09:05:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31uwyptq3e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Jun 2020 09:04:57 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QD2uw4044685;
        Fri, 26 Jun 2020 09:04:54 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31uwyptq0v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Jun 2020 09:04:53 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QD1WnP026082;
        Fri, 26 Jun 2020 13:04:49 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma03fra.de.ibm.com with ESMTP id 31uusghg67-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Jun 2020 13:04:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05QD4i0W54329560
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 13:04:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 789AFA404D;
        Fri, 26 Jun 2020 13:04:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 30700A4055;
        Fri, 26 Jun 2020 13:04:43 +0000 (GMT)
Received: from [9.79.219.159] (unknown [9.79.219.159])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 26 Jun 2020 13:04:42 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
From:   Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <8b34f78e-937d-c693-5167-85070b587193@gmail.com>
Date:   Fri, 26 Jun 2020 18:34:41 +0530
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <5044AB92-1CF7-43E1-A05F-97D06E6A5154@linux.vnet.ibm.com>
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
 <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
 <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
 <0391e655-d6ef-b459-0c8c-b65d232006c4@gmail.com>
 <8b34f78e-937d-c693-5167-85070b587193@gmail.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-26_06:2020-06-26,2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 cotscore=-2147483648 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260091
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I will do some study here. Thank you for the prompt response Jacek.

Thanks,
!! Vishwa !!

> On 22-Jun-2020, at 4:31 PM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
> On 6/22/20 12:54 PM, Jacek Anaszewski wrote:
>> Hi Vishwanatha,
>> On 6/22/20 8:58 AM, Vishwanatha Subbanna wrote:
>>> Thank you very much Jacek.
>>> 
>>>> On 22-Jun-2020, at 3:12 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>> 
>>>> Hi Vishwanatha,
>>>> 
>>>> On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
>>>>> Hi Jacek,
>>>>> Thank you very much for the quick response. Greatly appreciate that.
>>>> 
>>>> You're welcome.
>>>> 
>>>>>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>>>> 
>>>>>> Hi Vishwanatha,
>>>>>> 
>>>>>> Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>>>>> 
>>>>>> At first glance I don't get why you have gpio-leds node, which is for
>>>>>> leds-gpio driver.
>>>>> Not sure I understood it right.. But if you are asking me why I have "leds {"  and “gpio-leds” in there, then it is to get the entries in /sys/class/leds.
>>>>> The GPIOs from PCA9552 are connected to LED. Also, that is how we have had in the past, and that worked.
>>>>> Example: https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115 
>>>> 
>>>> Thanks. Yeah, that looks OK, I had to take closer look at the driver.
>>>> 
>>>>> The problem I am running into is for : https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
>>>>>> 
>>>>>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>>>>>> Hello,
>>>>>>> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
>>>>>>> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
>>>>>>> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
>>>>>>>   leds {
>>>>>>>          compatible = "gpio-leds”;
>>>>>>>          fan0 {
>>>>>>>              retain-state-shutdown;
>>>>>>>              default-state = "keep";
>>>>>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>>>          };
>>>>>>> };
>>>>>>> &i2c7 {
>>>>>>>      status = "okay”;
>>>>>>>      pca0: pca9552@61 {
>>>>>>>         compatible = "nxp,pca9552";
>>>>>>>          reg = <0x61>;
>>>>>>>          #address-cells = <1>;
>>>>>>>          #size-cells = <0>;
>>>>>>>          gpio-controller;
>>>>>>>          #gpio-cells = <2>;
>>>>>>>          gpio@0 {
>>>>>>>              reg = <0>;
>>>>>>>              type = <PCA955X_TYPE_GPIO>;
>>>>>>>           };
>>>>>>>      };
>>>>>>> };
>>>>>>> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.
>>>>>> 
>>>>>> Please share your DT node after the update.
>>>>>> 
>>>>> Pasting the GPIO_0 entry only here for brevity.
>>>>> leds {
>>>>>          compatible = "gpio-leds”;
>>>>>          fan0 {
>>>>>              retain-state-shutdown;
>>>>>              default-state = "keep";
>>>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>          };
>>>>>          nvmeslot0 {
>>>>>              retain-state-shutdown;
>>>>>              default-state = "keep";
>>>>>              gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>>>>>          };
>>>>> };
>>>>> &i2c7 {
>>>>>      status = "okay”;
>>>>>      pca0: pca9552@61 {
>>>>>         compatible = "nxp,pca9552";
>>>>>          reg = <0x61>;
>>>>>          #address-cells = <1>;
>>>>>          #size-cells = <0>;
>>>>>          gpio-controller;
>>>>>          #gpio-cells = <2>;
>>>>>          gpio@0 {
>>>>>              reg = <0>;
>>>>>              type = <PCA955X_TYPE_GPIO>;
>>>>>           };
>>>>>      };
>>>>> };
>>>>> &i2c13
>>>>> {
>>>>>      pca1: pca9552@60 {
>>>>>         compatible = "nxp,pca9552";
>>>>>         reg = <0x60>;
>>>>>         #address-cells = <1>;
>>>>>         #size-cells = <0>;
>>>>>         gpio-controller;
>>>>>         #gpio-cells = <2>;
>>>>>         gpio@0 {
>>>>>             reg = <0>;
>>>>>             type = <PCA955X_TYPE_GPIO>;
>>>>>         };
>>>>>      };
>>>>> };
>>>>> Thanks
>>>>> !! Vishwa !!
>>>>>>> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
>>>>>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>>>>>> Data from the failure.
>>>>>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
>>>>>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
>>>> 
>>>> It is weird that you don't see "fan0" LED since this gpio seems to have
>>>> been properly registered according to this log.
>>>> 
>>> 
>>> 
>>> This is exactly what I don’t understand. I would expect “fan0” to appear in /sys/class/leds. Is there any reason why this might not be appearing ?..
>> OK, now the reason is clear to me. If leds-gpio driver fails to register
>> any of the LEDs found in DT node it returns with an error from the
>> probe(), which results in unregistering any of the LEDs registered in
>> the previous iteration steps.
>> Look at the function gpio_leds_create() in
>> drivers/leds/leds-gpio.c.
>> Probably it is devm_fwnode_get_gpiod_from_child() that fails
>> while parsing nvmeslot0 node.
> 
> IOW you have to have two separate dts files for the arrangement
> with the card and without it.
> 
> -- 
> Best regards,
> Jacek Anaszewski


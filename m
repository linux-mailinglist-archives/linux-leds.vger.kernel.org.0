Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10EEA203EE6
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 20:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgFVSPo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Mon, 22 Jun 2020 14:15:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29982 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729873AbgFVSPn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 22 Jun 2020 14:15:43 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05MI8rsX146571;
        Mon, 22 Jun 2020 14:15:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31tyspbu6m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 14:15:37 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05MI9CvL147555;
        Mon, 22 Jun 2020 14:15:37 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31tyspbu5u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 14:15:37 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MI11II029154;
        Mon, 22 Jun 2020 18:15:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma03ams.nl.ibm.com with ESMTP id 31sa383sx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 18:15:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05MIFWbn56033530
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Jun 2020 18:15:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6C553AE053;
        Mon, 22 Jun 2020 18:15:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 05F0FAE058;
        Mon, 22 Jun 2020 18:15:31 +0000 (GMT)
Received: from [9.199.56.116] (unknown [9.199.56.116])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 22 Jun 2020 18:15:30 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
From:   Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <F6E7B2CD-3871-4C41-A7F0-8A77E824D155@linux.vnet.ibm.com>
Date:   Mon, 22 Jun 2020 23:43:21 +0530
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <AE5645E7-3EEA-419B-902E-C015AD0122A2@linux.vnet.ibm.com>
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
 <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
 <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
 <0391e655-d6ef-b459-0c8c-b65d232006c4@gmail.com>
 <C3359491-9196-466B-85FD-C85957F342DE@linux.vnet.ibm.com>
 <346b0a22-12ce-150c-a7a1-fb1d066a4c16@gmail.com>
 <F6E7B2CD-3871-4C41-A7F0-8A77E824D155@linux.vnet.ibm.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-22_10:2020-06-22,2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 cotscore=-2147483648 impostorscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006220121
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Apologies if you already received. I got a mailer Damon error. Resending it

Thanks,
!! Vishwa !!

> On 22-Jun-2020, at 6:42 PM, Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com> wrote:
> 
> Hi Jacek,
> 
>> On 22-Jun-2020, at 5:06 PM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>> 
>> On 6/22/20 1:07 PM, Vishwanatha Subbanna wrote:
>>> Hi Jacek,
>>>> On 22-Jun-2020, at 4:24 PM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>> 
>>>> Hi Vishwanatha,
>>>> 
>>>> On 6/22/20 8:58 AM, Vishwanatha Subbanna wrote:
>>>>> Thank you very much Jacek.
>>>>>> On 22-Jun-2020, at 3:12 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>>>> 
>>>>>> Hi Vishwanatha,
>>>>>> 
>>>>>> On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
>>>>>>> Hi Jacek,
>>>>>>> Thank you very much for the quick response. Greatly appreciate that.
>>>>>> 
>>>>>> You're welcome.
>>>>>> 
>>>>>>>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>>>>>> 
>>>>>>>> Hi Vishwanatha,
>>>>>>>> 
>>>>>>>> Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>>>>>>> 
>>>>>>>> At first glance I don't get why you have gpio-leds node, which is for
>>>>>>>> leds-gpio driver.
>>>>>>> Not sure I understood it right.. But if you are asking me why I have "leds {"  and “gpio-leds” in there, then it is to get the entries in /sys/class/leds.
>>>>>>> The GPIOs from PCA9552 are connected to LED. Also, that is how we have had in the past, and that worked.
>>>>>>> Example: https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115
>>>>>> 
>>>>>> Thanks. Yeah, that looks OK, I had to take closer look at the driver.
>>>>>> 
>>>>>>> The problem I am running into is for : https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>>>>>> 
>>>>>>>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>>>>>>>> Hello,
>>>>>>>>> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
>>>>>>>>> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
>>>>>>>>> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
>>>>>>>>> leds {
>>>>>>>>>        compatible = "gpio-leds”;
>>>>>>>>>        fan0 {
>>>>>>>>>            retain-state-shutdown;
>>>>>>>>>            default-state = "keep";
>>>>>>>>>            gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>>>>>        };
>>>>>>>>> };
>>>>>>>>> &i2c7 {
>>>>>>>>>    status = "okay”;
>>>>>>>>>    pca0: pca9552@61 {
>>>>>>>>>       compatible = "nxp,pca9552";
>>>>>>>>>        reg = <0x61>;
>>>>>>>>>        #address-cells = <1>;
>>>>>>>>>        #size-cells = <0>;
>>>>>>>>>        gpio-controller;
>>>>>>>>>        #gpio-cells = <2>;
>>>>>>>>>        gpio@0 {
>>>>>>>>>            reg = <0>;
>>>>>>>>>            type = <PCA955X_TYPE_GPIO>;
>>>>>>>>>     	};
>>>>>>>>>    };
>>>>>>>>> };
>>>>>>>>> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.
>>>>>>>> 
>>>>>>>> Please share your DT node after the update.
>>>>>>>> 
>>>>>>> Pasting the GPIO_0 entry only here for brevity.
>>>>>>> leds {
>>>>>>>        compatible = "gpio-leds”;
>>>>>>>        fan0 {
>>>>>>>            retain-state-shutdown;
>>>>>>>            default-state = "keep";
>>>>>>>            gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>>>        };
>>>>>>>        nvmeslot0 {
>>>>>>>            retain-state-shutdown;
>>>>>>>            default-state = "keep";
>>>>>>>            gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>>>>>>>        };
>>>>>>> };
>>>>>>> &i2c7 {
>>>>>>>    status = "okay”;
>>>>>>>    pca0: pca9552@61 {
>>>>>>>       compatible = "nxp,pca9552";
>>>>>>>        reg = <0x61>;
>>>>>>>        #address-cells = <1>;
>>>>>>>        #size-cells = <0>;
>>>>>>>        gpio-controller;
>>>>>>>        #gpio-cells = <2>;
>>>>>>>        gpio@0 {
>>>>>>>            reg = <0>;
>>>>>>>            type = <PCA955X_TYPE_GPIO>;
>>>>>>>     	};
>>>>>>>    };
>>>>>>> };
>>>>>>> &i2c13
>>>>>>> {
>>>>>>>    pca1: pca9552@60 {
>>>>>>>       compatible = "nxp,pca9552";
>>>>>>>       reg = <0x60>;
>>>>>>>       #address-cells = <1>;
>>>>>>>       #size-cells = <0>;
>>>>>>>       gpio-controller;
>>>>>>>       #gpio-cells = <2>;
>>>>>>>       gpio@0 {
>>>>>>>           reg = <0>;
>>>>>>>           type = <PCA955X_TYPE_GPIO>;
>>>>>>>       };
>>>>>>>    };
>>>>>>> };
>>>>>>> Thanks
>>>>>>> !! Vishwa !!
>>>>>>>>> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
>>>>>>>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>>>>>>>> Data from the failure.
>>>>>>>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
>>>>>>>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
>>>>>> 
>>>>>> It is weird that you don't see "fan0" LED since this gpio seems to have
>>>>>> been properly registered according to this log.
>>>>>> 
>>>>> This is exactly what I don’t understand. I would expect “fan0” to appear in /sys/class/leds. Is there any reason why this might not be appearing ?..
>>>> 
>>>> OK, now the reason is clear to me. If leds-gpio driver fails to register
>>>> any of the LEDs found in DT node it returns with an error from the
>>>> probe(), which results in unregistering any of the LEDs registered in
>>>> the previous iteration steps.
>>>> 
>>>> Look at the function gpio_leds_create() in
>>>> drivers/leds/leds-gpio.c.
>>>> 
>>>> Probably it is devm_fwnode_get_gpiod_from_child() that fails
>>>> while parsing nvmeslot0 node.
>>> Is this how it is designed or a bug ?.. From a system standpoint, not having an optional card results in not seeing the ones that are present on the system.
>>> Would you think it is worthwhile to modify to not chuck off what is existing because something optional is not plugged in ?.. I believe the I2C driver handles this scenario by putting an error message but still consumes what is present.
>> 
>> Well, this code is in mainline for some time and we cannot guarantee
>> the someone does not rely on this behavior.
>> 
> 
> Should someone assume those behaviours ?.. Would it be okay to put an email to the gpio-leds community ?. Just in my opinion, I see a lot of value in modifying it. Also, is there an IRC where we can discuss this than the email ?
> 
>> You mentioned, that your card is not hot-pluggable so it is even more
>> justified to treat the two hardware setups as demanding a separate DT.
>> 
> 
> I mean, it is the same system that can either have a card on the slot or don’t have it. So, it’s not really a different system needing different DT.
> Also, it has 3 slots and we can have multiple combinations :)
> 
>> Otherwise you could probably employ DT overlays mechanism.
>> 
> 
> Hmm.. this looks interesting in a quick glance. However, I feel the current leds-gpio driver needs to be updated to not discard the valid ones.
> Besides someone may be counting on the existing behaviour, is there any reason why we want to maintain leds-gpio the way it is and not do what I2C driver does for example.
> 
> Thank you,
> !! Vishwa !!
> 
>> -- 
>> Best regards,
>> Jacek Anaszewski


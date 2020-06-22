Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3418320300A
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 09:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgFVHBE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Mon, 22 Jun 2020 03:01:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55340 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725933AbgFVHBD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 22 Jun 2020 03:01:03 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05M6Wa34043252;
        Mon, 22 Jun 2020 03:00:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31sne8nh6r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 03:00:55 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05M6dsN9067196;
        Mon, 22 Jun 2020 03:00:54 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31sne8nh50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 03:00:54 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M6pfoq014735;
        Mon, 22 Jun 2020 07:00:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma05fra.de.ibm.com with ESMTP id 31sa37s4pv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Jun 2020 07:00:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05M6xVsf49283370
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Jun 2020 06:59:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C9FBA52051;
        Mon, 22 Jun 2020 07:00:49 +0000 (GMT)
Received: from [9.85.120.237] (unknown [9.85.120.237])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 6C06C52054;
        Mon, 22 Jun 2020 07:00:48 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
From:   Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
Date:   Mon, 22 Jun 2020 12:28:23 +0530
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
 <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-22_01:2020-06-19,2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 cotscore=-2147483648 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220045
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thank you very much Jacek.

> On 22-Jun-2020, at 3:12 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
> Hi Vishwanatha,
> 
> On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
>> Hi Jacek,
>> Thank you very much for the quick response. Greatly appreciate that.
> 
> You're welcome.
> 
>>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>> 
>>> Hi Vishwanatha,
>>> 
>>> Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>> 
>>> At first glance I don't get why you have gpio-leds node, which is for
>>> leds-gpio driver.
>> Not sure I understood it right.. But if you are asking me why I have "leds {"  and “gpio-leds” in there, then it is to get the entries in /sys/class/leds.
>> The GPIOs from PCA9552 are connected to LED. Also, that is how we have had in the past, and that worked.
>> Example: https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115
> 
> Thanks. Yeah, that looks OK, I had to take closer look at the driver.
> 
>> The problem I am running into is for : https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> 
>>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>>> Hello,
>>>> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
>>>> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
>>>> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
>>>>  leds {
>>>>         compatible = "gpio-leds”;
>>>>         fan0 {
>>>>             retain-state-shutdown;
>>>>             default-state = "keep";
>>>>             gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>         };
>>>> };
>>>> &i2c7 {
>>>>     status = "okay”;
>>>>     pca0: pca9552@61 {
>>>>        compatible = "nxp,pca9552";
>>>>         reg = <0x61>;
>>>>         #address-cells = <1>;
>>>>         #size-cells = <0>;
>>>>         gpio-controller;
>>>>         #gpio-cells = <2>;
>>>>         gpio@0 {
>>>>             reg = <0>;
>>>>             type = <PCA955X_TYPE_GPIO>;
>>>>      	};
>>>>     };
>>>> };
>>>> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.
>>> 
>>> Please share your DT node after the update.
>>> 
>> Pasting the GPIO_0 entry only here for brevity.
>> leds {
>>         compatible = "gpio-leds”;
>>         fan0 {
>>             retain-state-shutdown;
>>             default-state = "keep";
>>             gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>         };
>>         nvmeslot0 {
>>             retain-state-shutdown;
>>             default-state = "keep";
>>             gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>>         };
>> };
>> &i2c7 {
>>     status = "okay”;
>>     pca0: pca9552@61 {
>>        compatible = "nxp,pca9552";
>>         reg = <0x61>;
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>         gpio-controller;
>>         #gpio-cells = <2>;
>>         gpio@0 {
>>             reg = <0>;
>>             type = <PCA955X_TYPE_GPIO>;
>>      	};
>>     };
>> };
>> &i2c13
>> {
>>     pca1: pca9552@60 {
>>        compatible = "nxp,pca9552";
>>        reg = <0x60>;
>>        #address-cells = <1>;
>>        #size-cells = <0>;
>>        gpio-controller;
>>        #gpio-cells = <2>;
>>        gpio@0 {
>>            reg = <0>;
>>            type = <PCA955X_TYPE_GPIO>;
>>        };
>>     };
>> };
>> Thanks
>> !! Vishwa !!
>>>> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
>>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>>> Data from the failure.
>>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
>>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
> 
> It is weird that you don't see "fan0" LED since this gpio seems to have
> been properly registered according to this log.
> 


This is exactly what I don’t understand. I would expect “fan0” to appear in /sys/class/leds. Is there any reason why this might not be appearing ?.. 


>>>> [    7.913012] leds-pca955x 13-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
>>>> [    7.923486] leds-pca955x 13-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
> 
> This indicates the problem with finding pca955x device at address 0x60
> on I2C bus connected to the I2C controller labelled as i2c13.
> 
> There are two options:
> 1) There is a problem with a physical connection with the chip on the
>   card
> 2) You mismatched the I2C controller with the bus that controls the card
> 
> -- 

The PCA at address 0x60 is on the optional card that is not connected in my experiment. This is expected. However, what is not expected is the “fan0” missing even through it is on the planar. Looks like the leds driver is chucking off even the good ones even if there is at least one GPIO that can not be acquired. 

Thank you,
!! Vishwa !!

> Best regards,
> Jacek Anaszewski


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E2C20259A
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2020 19:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgFTR2K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sat, 20 Jun 2020 13:28:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19190 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726838AbgFTR2K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 20 Jun 2020 13:28:10 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05KH0jE9098859;
        Sat, 20 Jun 2020 13:28:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 31sgqwe31m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 20 Jun 2020 13:28:05 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05KHCTQs125344;
        Sat, 20 Jun 2020 13:28:05 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 31sgqwe31d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 20 Jun 2020 13:28:05 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05KHQPcC005615;
        Sat, 20 Jun 2020 17:28:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma04ams.nl.ibm.com with ESMTP id 31sa37rsnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 20 Jun 2020 17:28:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05KHS0fK60555370
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 20 Jun 2020 17:28:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BC1B74203F;
        Sat, 20 Jun 2020 17:28:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B2EB642042;
        Sat, 20 Jun 2020 17:27:59 +0000 (GMT)
Received: from [9.199.62.172] (unknown [9.199.62.172])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sat, 20 Jun 2020 17:27:59 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
From:   Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
Date:   Sat, 20 Jun 2020 22:55:46 +0530
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-20_09:2020-06-19,2020-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 cotscore=-2147483648
 malwarescore=0 clxscore=1015 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006200123
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

Thank you very much for the quick response. Greatly appreciate that.

> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
> Hi Vishwanatha,
> 
> Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.
> 
> At first glance I don't get why you have gpio-leds node, which is for
> leds-gpio driver.

Not sure I understood it right.. But if you are asking me why I have "leds {"  and “gpio-leds” in there, then it is to get the entries in /sys/class/leds.
The GPIOs from PCA9552 are connected to LED. Also, that is how we have had in the past, and that worked.

Example: https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115

The problem I am running into is for : https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts

> 
> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>> Hello,
>> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
>> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
>> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
>>  leds {
>>         compatible = "gpio-leds”;
>>         fan0 {
>>             retain-state-shutdown;
>>             default-state = "keep";
>>             gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
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
>> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.
> 
> Please share your DT node after the update.
> 

Pasting the GPIO_0 entry only here for brevity.

leds {
        compatible = "gpio-leds”;

        fan0 {
            retain-state-shutdown;
            default-state = "keep";
            gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
        };

        nvmeslot0 {
            retain-state-shutdown;
            default-state = "keep";
            gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
        };
};

&i2c7 {
    status = "okay”;
    pca0: pca9552@61 {
       compatible = "nxp,pca9552";
        reg = <0x61>;
        #address-cells = <1>;
        #size-cells = <0>;
        gpio-controller;
        #gpio-cells = <2>;

        gpio@0 {
            reg = <0>;
            type = <PCA955X_TYPE_GPIO>;
     	};
    };
};

&i2c13
{
    pca1: pca9552@60 {
       compatible = "nxp,pca9552";
       reg = <0x60>;
       #address-cells = <1>;
       #size-cells = <0>;

       gpio-controller;
       #gpio-cells = <2>;

       gpio@0 {
           reg = <0>;
           type = <PCA955X_TYPE_GPIO>;
       };
    };
};

Thanks
!! Vishwa !!

>> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
>> However, I could see all the entries in “/proc/device-tree/leds”.
>> Data from the failure.
>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
>> [    7.913012] leds-pca955x 13-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
>> [    7.923486] leds-pca955x 13-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
>> [    7.931695] leds-pca955x 14-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
>> [    7.942138] leds-pca955x 14-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
>> [    7.950320] leds-pca955x 15-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
>> root@bmc:/sys/class/gpio/# ls -l
>> lrwxrwxrwx    1 root     root             0 Jan  1  1970 gpiochip168 -> ../../devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a400.i2c-bus/i2c-7/7-0061/gpio/gpiochip168
>> root@bmc:/sys/class/gpio/gpiochip168/device# ls -l
>> lrwxrwxrwx    1 root     root             0 Jun  3 22:03 driver -> ../../../../../../../../bus/i2c/drivers/leds-pca955x
>> drwxr-xr-x    3 root     root             0 Jan  1  1970 gpio
>> drwxr-xr-x    3 root     root             0 Jan  1  1970 gpiochip3
>> -r--r--r--    1 root     root          4096 Jun  3 22:03 modalias
>> -r--r--r--    1 root     root          4096 Jan  1  1970 name
>> lrwxrwxrwx    1 root     root             0 Jun  3 22:03 of_node -> ../../../../../../../../firmware/devicetree/base/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@61
>> drwxr-xr-x    2 root     root             0 Jun  3 22:03 power
>> lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -> ../../../../../../../../bus/i2c
>> -rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
>> root@bmc:/sys/class/gpio/gpiochip168/device# ls -l gpio
>> Thank you,
>> !! Vishwa !!
> 
> -- 
> Best regards,
> Jacek Anaszewski


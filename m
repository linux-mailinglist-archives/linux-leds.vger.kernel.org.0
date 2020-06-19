Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3252200A49
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2020 15:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731492AbgFSNgo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 19 Jun 2020 09:36:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64384 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731396AbgFSNgn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Jun 2020 09:36:43 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05JDWTvh154823;
        Fri, 19 Jun 2020 09:36:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31rg0s76au-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Jun 2020 09:36:37 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05JDXSi3163103;
        Fri, 19 Jun 2020 09:36:37 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31rg0s769h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Jun 2020 09:36:36 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDa97v030110;
        Fri, 19 Jun 2020 13:36:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma04ams.nl.ibm.com with ESMTP id 31qur633hh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Jun 2020 13:36:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05JDaWZd20185322
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Jun 2020 13:36:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F0C0DA4040;
        Fri, 19 Jun 2020 13:36:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F16DBA4057;
        Fri, 19 Jun 2020 13:36:30 +0000 (GMT)
Received: from [9.77.195.31] (unknown [9.77.195.31])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 19 Jun 2020 13:36:30 +0000 (GMT)
From:   Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Leds-gpio discarding the entries in /sys/class/leds : Linux 5.4.38
Message-Id: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
Date:   Fri, 19 Jun 2020 19:04:06 +0530
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-19_11:2020-06-19,2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011 spamscore=0
 cotscore=-2147483648 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190096
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello, 

I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38

I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.

In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0

 leds {
        compatible = "gpio-leds”;

        fan0 {
            retain-state-shutdown;
            default-state = "keep";
            gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
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

Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds. 
I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.

However, I could see all the entries in “/proc/device-tree/leds”.

Data from the failure.

[    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
[    7.907659] leds-pca955x 7-0061: gpios 168...183
[    7.913012] leds-pca955x 13-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
[    7.923486] leds-pca955x 13-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
[    7.931695] leds-pca955x 14-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
[    7.942138] leds-pca955x 14-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
[    7.950320] leds-pca955x 15-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60

root@bmc:/sys/class/gpio/# ls -l
lrwxrwxrwx    1 root     root             0 Jan  1  1970 gpiochip168 -> ../../devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a400.i2c-bus/i2c-7/7-0061/gpio/gpiochip168

root@bmc:/sys/class/gpio/gpiochip168/device# ls -l
lrwxrwxrwx    1 root     root             0 Jun  3 22:03 driver -> ../../../../../../../../bus/i2c/drivers/leds-pca955x
drwxr-xr-x    3 root     root             0 Jan  1  1970 gpio
drwxr-xr-x    3 root     root             0 Jan  1  1970 gpiochip3
-r--r--r--    1 root     root          4096 Jun  3 22:03 modalias
-r--r--r--    1 root     root          4096 Jan  1  1970 name
lrwxrwxrwx    1 root     root             0 Jun  3 22:03 of_node -> ../../../../../../../../firmware/devicetree/base/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@61
drwxr-xr-x    2 root     root             0 Jun  3 22:03 power
lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -> ../../../../../../../../bus/i2c
-rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
root@bmc:/sys/class/gpio/gpiochip168/device# ls -l gpio

Thank you,
!! Vishwa !!


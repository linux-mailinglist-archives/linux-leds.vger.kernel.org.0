Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED37C21533C
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2020 09:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgGFHVW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Mon, 6 Jul 2020 03:21:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16934 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728225AbgGFHVV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Jul 2020 03:21:21 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06671Q4S173121;
        Mon, 6 Jul 2020 03:21:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 322kcx3h7y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 03:21:13 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06671bFN173897;
        Mon, 6 Jul 2020 03:21:12 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0b-001b2d01.pphosted.com with ESMTP id 322kcx3h78-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 03:21:12 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0667GG8O031359;
        Mon, 6 Jul 2020 07:21:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma02fra.de.ibm.com with ESMTP id 322hd8219v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 07:21:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0667IWQV58917274
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 6 Jul 2020 07:18:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A270FA405D;
        Mon,  6 Jul 2020 07:19:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 67460A4053;
        Mon,  6 Jul 2020 07:19:52 +0000 (GMT)
Received: from [9.199.61.209] (unknown [9.199.61.209])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon,  6 Jul 2020 07:19:52 +0000 (GMT)
From:   Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Query on using leds-gpio driver on a. GPIO with ACTIVE_HIGH
Message-Id: <30E1B20C-676E-45E2-9394-643262B5D04A@linux.vnet.ibm.com>
Date:   Mon, 6 Jul 2020 12:49:50 +0530
Cc:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-06_03:2020-07-06,2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 cotscore=-2147483648 mlxlogscore=999 mlxscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060051
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

I have been a user of “leds-gpio” driver to manage the LEDs on IBM servers. So far, all these LEDs that were controlled by GPIO were ACTIVE_LOW.

Example from DTS.

        fan3 {
            retain-state-shutdown;
            default-state = "keep";
            gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
        };

I wanted to know if it makes any difference to the user if the GPIO is ACTIVE_HIGH. I read through https://www.kernel.org/doc/Documentation/gpio/board.txt and it seemed we should be able to use it.

However, going through https://github.com/torvalds/linux/blob/master/drivers/leds/leds-pca955x.c, I am not quite sure if the ACTIVE_HIGH can be used same as ACTIVE_LOW since I saw these :


#define PCA955X_LS_LED_ON	0x0	/* Output LOW */
#define PCA955X_LS_LED_OFF	0x1	/* Output HI-Z */

#define PCA955X_GPIO_HIGH	LED_OFF
#define PCA955X_GPIO_LOW	LED_FULL


This will be my DT entry : 

        fan3 {
            retain-state-shutdown;
            default-state = "keep";
            gpios = <&pca0 3 GPIO_ACTIVE_HIGH>;
        };

Will I be able to use the same “leds-gpio” interfaces irrespective of GPIO_LOW / GPIO_HIGH ? 

I use these interfaces today:

echo 255 > brightness —> Turn Solid_ON
echo 0 > brightness —> Turn OFF
echo “timer” > trigger —> Initiate Blink
echo “none” > trigger —> Terminate Blink


Thank you,

!! Vishwa !

Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B71321A8B5
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 22:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgGIUMc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 16:12:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3670 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726213AbgGIUMb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 16:12:31 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 069K27uH130278;
        Thu, 9 Jul 2020 16:12:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 325kh4dnew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 16:12:24 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 069K2p6v134286;
        Thu, 9 Jul 2020 16:12:24 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 325kh4dnen-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 16:12:24 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069K4DJZ000811;
        Thu, 9 Jul 2020 20:12:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma01dal.us.ibm.com with ESMTP id 325k1yb0m5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 20:12:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 069KCMYt41484758
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 Jul 2020 20:12:22 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4CA4D124054;
        Thu,  9 Jul 2020 20:12:22 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CC1A124055;
        Thu,  9 Jul 2020 20:12:21 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.54.227])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  9 Jul 2020 20:12:21 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, eajames@linux.ibm.com,
        vishwa@linux.ibm.com
Subject: [PATCH 0/2] leds: pca955x: Add IBM software implemenation of the PCA9552 chip
Date:   Thu,  9 Jul 2020 15:12:18 -0500
Message-Id: <20200709201220.13736-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-09_10:2020-07-09,2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=629
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0 bulkscore=0
 spamscore=0 suspectscore=1 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090132
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

IBM created an implementation of the PCA9552 on a PIC16F
microcontroller. The I2C device addresses are different from the
hardware PCA9552, so add a new compatible string and associated
platform data to be able to probe this device, and document the new
string.

Eddie James (2):
  dt-bindings: leds: pca955x: Add IBM implementation compatible string
  leds: pca955x: Add an IBM software implementation of the PCA9552 chip

 Documentation/devicetree/bindings/leds/leds-pca955x.txt | 1 +
 drivers/leds/leds-pca955x.c                             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.24.0


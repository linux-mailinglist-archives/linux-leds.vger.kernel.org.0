Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BBC23A8E2
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 16:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgHCOvG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 10:51:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60096 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726189AbgHCOvG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 10:51:06 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 073Ea1wr095836;
        Mon, 3 Aug 2020 10:50:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32pkehjkp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 10:50:59 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 073EaBaV096607;
        Mon, 3 Aug 2020 10:50:59 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32pkehjknf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 10:50:59 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073Enifb015875;
        Mon, 3 Aug 2020 14:50:57 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma02wdc.us.ibm.com with ESMTP id 32n018rtn9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 14:50:57 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 073Eorf064618862
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 3 Aug 2020 14:50:53 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9B7DA136051;
        Mon,  3 Aug 2020 14:50:56 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1A41213605D;
        Mon,  3 Aug 2020 14:50:56 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.93.250])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  3 Aug 2020 14:50:55 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, vishwa@linux.ibm.com,
        andy.shevchenko@gmail.com, eajames@linux.ibm.com
Subject: [PATCH v2 0/2] leds: pca955x: Add IBM software implemenation of the PCA9552 chip
Date:   Mon,  3 Aug 2020 09:50:53 -0500
Message-Id: <20200803145055.5203-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_13:2020-08-03,2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 mlxlogscore=753 suspectscore=1
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030110
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

IBM created an implementation of the PCA9552 on a PIC16F
microcontroller. The I2C device addresses are different from the
hardware PCA9552, so add a new compatible string and associated
platform data to be able to probe this device, and document the new
string.

Changes since v1:
 - Switch the vendor part of the compatible string to ibm
 - Change the enum in the driver to be ibm_<part no>

Eddie James (2):
  dt-bindings: leds: pca955x: Add IBM implementation compatible string
  leds: pca955x: Add an IBM software implementation of the PCA9552 chip

 Documentation/devicetree/bindings/leds/leds-pca955x.txt | 1 +
 drivers/leds/leds-pca955x.c                             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.24.0


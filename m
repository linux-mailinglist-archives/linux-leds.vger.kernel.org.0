Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24AFE4FE613
	for <lists+linux-leds@lfdr.de>; Tue, 12 Apr 2022 18:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357770AbiDLQoq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Apr 2022 12:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238981AbiDLQop (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2022 12:44:45 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568C852E50;
        Tue, 12 Apr 2022 09:42:27 -0700 (PDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn2jl024494;
        Tue, 12 Apr 2022 16:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yjFUmtF9lzw/pLS2jT7ftcOi8fa7TEqX29DpniEUwqg=;
 b=ttGxR0MFBsHlBGuanhpp4CDzpojpP8SeQ1c8c97zHQCffkGOR1dZeZ9pJ51SPn0t2AZO
 tc/vvArtpiZmSzNOfQKo2SooFiMmDxgCx6IO3HAXlx075yzBhPy00upIMUGqjjx3WSHW
 10fg6F7TWrDmhQ9bo2K09U7BiyJS4d3qxTYq7uGo6sliBiTbw7qT2yP8qRKpzhTfoXJM
 CoFYGSs5Ee7hvK1LAM6THAFees/iJ9wp+6A/HCgsq1/nPWm7p1uicGfH8+JrnE5H+XuA
 o96LOdMk43VXGHYPgMF451/3bW535/7gsF5/T+8tV6eCTxk8BZ1TO66SVoV/sHi31EMU gw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fdaqkv037-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Apr 2022 16:42:15 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGgEU0015226;
        Tue, 12 Apr 2022 16:42:14 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fdaqkv02r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Apr 2022 16:42:14 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGW0cX001653;
        Tue, 12 Apr 2022 16:42:13 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma01wdc.us.ibm.com with ESMTP id 3fb1s91e96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Apr 2022 16:42:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23CGgDiO27656702
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 16:42:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 08172AE064;
        Tue, 12 Apr 2022 16:42:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1592EAE05F;
        Tue, 12 Apr 2022 16:42:12 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.113.187])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 12 Apr 2022 16:42:11 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, joel@jms.id.au, dan.carpenter@oracle.com,
        patrick@stwcx.xyz, andy.shevchenko@gmail.com
Subject: [PATCH v4 0/4] leds: pca955x: Add HW blink support
Date:   Tue, 12 Apr 2022 11:42:07 -0500
Message-Id: <20220412164211.28824-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tyK17CKS3GPSsTcnh8xvB004_JUm6lUJ
X-Proofpoint-ORIG-GUID: n3jTm-RN7LKzR09Pxp_JBHiOOHpwiRa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=640 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120079
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series adds support for blinking using the PCA955x chip, falling
back to software blinking if another LED on the chip is already blinking
at a different rate, or if the requested rate isn't representable with
the PCA955x.
Also included are some minor clean up and optimization changes that make
the HW blinking a bit easier.

Changes since v3:
 - Initialize return value in the blink function
   Thanks Dan Carpenter and kernel test robot

Changes since v2:
 - Split the cleanup patch
 - Prettier dev_err calls
 - Include units for blink period and use defined unit translations
   rather than just a number.
 - Use positive conditionals.

Changes since v1:
 - Rework the blink function to fallback to software blinking if the
   period is out of range of the chip's capabilities or if another LED
   on the chip is already blinking at a different rate.
 - Add the cleanup patch

Eddie James (4):
  leds: pca955x: Refactor with helper functions and renaming
  leds: pca955x: Use pointers to driver data rather than I2C client
  leds: pca955x: Optimize probe led selection
  leds: pca955x: Add HW blink support

 drivers/leds/leds-pca955x.c | 341 ++++++++++++++++++++++++------------
 1 file changed, 232 insertions(+), 109 deletions(-)

-- 
2.27.0


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976063CBEE0
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236958AbhGPWGh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7570 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235209AbhGPWGg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:36 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GM3R9F119858;
        Fri, 16 Jul 2021 18:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=H3hidmuB+bwpAqM9Mc7uCBPE8mUH+/cjmGvrD/nU7+g=;
 b=c1v2uijRBakWGjq1lLUYBfd9z74iHnpLWFYEnkYJBZDUzGCmcNJzcrcVHNTMpkWpOZ1e
 qCs1aUBgdfmkQXZOzXKCbPTiYKwVheSlZmCpLUTDWnorvPl/YdzZKl2yZNydMLPCmeAB
 choBAfpI6NVO/LaFco0LBXk//+U471YJ1XgR/k8RzRwISM+bYykqCGTZ50skgD4cytAM
 mGRN9kEEW0un3mKpkB3Pn1LadXqn0ZE9feT0b9DQ4rTBqPv5RsAjVlUm8eDKAPtW98IG
 2ZnB8Rx6FZvuQh2eOTvOJw8jVKRhKSJqR9qD5GkRGRwfA42Hf0kbMR4W6+7eVhmCmp+g /A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39twuxr984-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:37 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLw2vH014412;
        Fri, 16 Jul 2021 22:03:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma03dal.us.ibm.com with ESMTP id 39rkgyca5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3Ztr39321858
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 05CCDC6063;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A62DFC6062;
        Fri, 16 Jul 2021 22:03:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:34 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 0/7] leds: Support retaining state for the PCA955x
Date:   Fri, 16 Jul 2021 17:03:24 -0500
Message-Id: <20210716220331.49303-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1uh0hzTdHlnYpRciX2ANJRDhowzRZnZS
X-Proofpoint-GUID: 1uh0hzTdHlnYpRciX2ANJRDhowzRZnZS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=825 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160140
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series implements the ability to retain the state of the LEDs
controlled by the PCA955x across system reboots. This includes a
change to the LED core driver to respect the retain-state-shutdown
device tree property. It also cleans up the PCA955x driver, adds the
ability to query the hardware LED brightness, switches the I2C probe
function to probe_new, and uses more core functionality for parsing
the fwnode.

Eddie James (7):
  dt-bindings: leds: Add retain-state-shutdown boolean
  leds: leds-core: Implement the retain-state-shutdown property
  leds: pca955x: Clean up code formatting
  leds: pca955x: Add brightness_get function
  leds: pca955x: Implement the default-state property
  leds: pca955x: Let the core process the fwnode
  leds: pca955x: Switch to i2c probe_new

 .../devicetree/bindings/leds/common.yaml      |   6 +
 drivers/leds/led-class.c                      |  10 +-
 drivers/leds/leds-pca955x.c                   | 232 +++++++++++++-----
 3 files changed, 182 insertions(+), 66 deletions(-)

-- 
2.27.0


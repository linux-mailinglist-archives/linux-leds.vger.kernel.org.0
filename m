Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A038439C836
	for <lists+linux-leds@lfdr.de>; Sat,  5 Jun 2021 14:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhFEMvU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Jun 2021 08:51:20 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53190 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhFEMvT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Jun 2021 08:51:19 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 155CnMeI118353;
        Sat, 5 Jun 2021 12:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=QGdiQREte4Iq+9DLVqOgLAmRkIXvemHDbtV0ipxRla0=;
 b=tWww5T14QhXoWYJfyUQARnpdpnFO299UlqHs+1YR0xYgeNWRRh4VeYojiuYpllY5zfd0
 oisu3SqYukEDk+yiKRUWIyaqvXtDDYN2o+b6ksgdpTkPszMYrsfAYs3S8Bx/mQKzbzbF
 A0pz/GumTwMNZGir6Pufd3Ib0ymQrxVjMc+Cj4K6JrzEDY/H99mx6IRue6R1In/7H+eG
 eXEvhON+yfefkplX4csrbXsuvaD5/QFDEdY3o0P0wINdURukTGvQACxUfqKUnuozr6ta
 m888cj4ANAuR/XBzimTGsV2td9jwzmIfxwhjV/DtqTfEHo9L84XVBH4czVgFEPHSpbb2 PA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 38yxsc8eg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Jun 2021 12:49:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 155CifFk010213;
        Sat, 5 Jun 2021 12:49:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38yya8yyk0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Jun 2021 12:49:22 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 155CnL6V014224;
        Sat, 5 Jun 2021 12:49:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 38yya8yyjs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Jun 2021 12:49:21 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 155CnI6E026537;
        Sat, 5 Jun 2021 12:49:18 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 05 Jun 2021 12:49:18 +0000
Date:   Sat, 5 Jun 2021 15:49:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     David Rivshin <drivshin@allworx.com>,
        Jacek Anaszewski <j.anaszewski@samsung.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: leds-is31fl32xx: fix an error in is31fl32xx_parse_dt()
Message-ID: <YLtyxq0Ty/7Uo4NS@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: d7r8JNgAyREaIxrFd_kT364OPEcdJgGF
X-Proofpoint-GUID: d7r8JNgAyREaIxrFd_kT364OPEcdJgGF
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10005 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106050092
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Return -EBUSY if the data is already in use (instead of returning
success).

Fixes: 9d7cffaf99f5 ("leds: Add driver for the ISSI IS31FL32xx family of LED controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  It prints an error so the intention seems clear, but
sometimes making stuff a failure instead of a success can lead to
unexpected problems in production.  On the other hand, if this is not
an error then shouldn't we do a continue instead of a goto err?

 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 3b55af9a8c58..e6f34464914f 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -386,6 +386,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 			dev_err(dev,
 				"Node %pOF 'reg' conflicts with another LED\n",
 				child);
+			ret = -EBUSY;
 			goto err;
 		}
 
-- 
2.30.2


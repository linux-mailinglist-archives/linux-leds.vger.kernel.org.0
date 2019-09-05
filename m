Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE353AA47F
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 15:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfIENdB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Sep 2019 09:33:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53560 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfIENc7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Sep 2019 09:32:59 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85DUNsN155864;
        Thu, 5 Sep 2019 13:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=BGe2+ZaOmCeYzkMCaGQ2bQHp7F9Salw4ouZzIm3rbvo=;
 b=Zgn/0mxbKmYolSDZKql8xnEZ5rpGg5jTnTyaAifdDoxuXZzGOMNBj9iINx9xvKf6ravS
 Sx9FWoHx/WXIeRxlwDw1xs8O28HIK2Zjkdq4xWFVhwL/R9QAPkefp3LU0BdepI36gz7L
 hxsOXAu/MbLsxwxiTuIWhkXMcqRpwESffgfGXZSRNfvl7VA0cjgY5iflREclGQPWgQBY
 TYjHB5zyQikcv2HkrfsI8UKuiPZOJgAzP4gKZygfR1D9XihzBHjamVe8F964u4aCUQRn
 VES4lwbssdcnY2c4cpeHI/forapci9sJwPfh6GB4PkiqCco63+Yek4+HMUiZTLm57Tf7 /g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2uu3a9g0hk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 13:32:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85DTTaS195773;
        Thu, 5 Sep 2019 13:32:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2utpmb7ntp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 13:32:46 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x85DWf47021418;
        Thu, 5 Sep 2019 13:32:41 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Sep 2019 06:32:41 -0700
Date:   Thu, 5 Sep 2019 16:32:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
Message-ID: <20190905133233.GF3093@kadam>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
 <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050132
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 05, 2019 at 03:23:21PM +0300, Oleh Kravchenko wrote:
> Let me summarize the chronology of the last activities below:
> 1. I have sent the patch for the bugs that I have found by static analyzer at PVS-Studio
>     Date: Wed, 4 Sep 2019 00:18:19 +0300
>     https://www.spinics.net/lists/linux-leds/msg13181.html
> 
> 2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with the same proposal
> 3. Uwe Kleine-König started to discuss his results of review by asking Dan on how he was found it.
> 
> Would you mine if you will keep me as a Original author of this patch based on fact 1?

Heh.

No, I didn't steal your patch.  :P  I am the author of the Smatch static
analysis tool and mostly fix things found by Smatch.  I don't use other
static analysis tools except to do a final QC of my patches.

It's super common for people to send duplicate fixes when it's based on
static analysis.  Most of the static analysis people hang out on
kernel-janitors so we don't send duplicate patches.  For a while people
were getting annoyed by all the duplicates but now they accept it as
their punishment for introducing a bug in the first place.

Anyway, the rule for kernel development is that normally the first
person's patch goes in, so we will take your patch.

regards,
dan carpenter


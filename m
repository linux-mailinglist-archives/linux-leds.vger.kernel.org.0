Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD26AAA3D7
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 15:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388294AbfIENE0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Sep 2019 09:04:26 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49728 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfIENE0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Sep 2019 09:04:26 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85CxWhY126699;
        Thu, 5 Sep 2019 13:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=ysG+kL+J5VLNH6TLBOniSdnJgCrTvcZcpU19yptxpMk=;
 b=imRn0DignCdedPmHyeQyX1aZWB1Ig7l0lVXF7YOP0dowFsIXbx0+9qjtiFwcakbkGO1h
 P/pDVbUI82NZHi3u80W72q+Xknjs2qXIPrjk1l8nKC4kXFMOlUgQvv3ePe1en2Nm5BsT
 keR5rbk5hQyJigoH+XMX3a5MpzoNnZFGUbqDideaMYIRo21kAXBRhHePDWiC9PrOWWzq
 F1cDiYOpNK4UVXq0dDCYPtxgeBNlsulBROcn051fSzU5hdCHjC1hnQ8wf9eQiifw/g92
 1FbyqlVKlxOq+QESBxX7pm2/JtsOwlk4jsRBuQCHyCwbnWEpHIdq0h7XxkQJ7q8IVHsS AQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2uu2jp853a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 13:04:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85D2bcC123576;
        Thu, 5 Sep 2019 13:04:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2uthq1pra4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 13:04:16 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x85D4Dog006730;
        Thu, 5 Sep 2019 13:04:13 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Sep 2019 06:04:12 -0700
Date:   Thu, 5 Sep 2019 16:04:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
Message-ID: <20190905130406.GE3093@kadam>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050128
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 05, 2019 at 02:06:26PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
> > The problem is we set "led_cdev->trigger = NULL;" and then dereference
> > it when we call write_lock_irqsave():
> > 
> > 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
> >                             ^^^^^^^^^^^^^^^^^
> > 
> > Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Obviously right. Thanks for catching.
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Did you find this at runtime or by using some static checker?

Yes.  It's a new one that I'm working on.

It's a tricky thing because it turns out Smatch thinks a whole lot of
pointers are definitely NULL when they aren't.  For example, if the
struct is allocated with kzalloc() and Smatch doesn't see where the
pointer is assigned.

regards,
dan carpenter


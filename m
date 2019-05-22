Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9DA260C7
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 11:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfEVJxh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 05:53:37 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52154 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbfEVJxh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 05:53:37 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4M9iIZU177954;
        Wed, 22 May 2019 09:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=YxZ3tZX4jC6l1SWgXVpj2Fbsst/0f0ut8YRqRLSUgBc=;
 b=xl62eqhoOOnkSTnDnT6oLbeC7rV+7cT5gGtglfoVcGnF35fuefrEkwI2UAKOrdXaY+Gj
 ACn440G0hKR0ZaoJvtPNt8HX7ql/srPtxwR+oARmxjwxPE+HvJ2tjM7+7cEFRArL5B+e
 C/ePm+izVgA3Y29awNzXysD7PkZRbPaxY1piCe2kcKjRWNiqRfQrMsn0OrrqnAQwFvwH
 8oi6oqklE2rkTuysp6RNfEOH3gCx/FbriOB7jsXBA2ZLvXiJ9ge2vOpOJzeGe7jT+1tY
 dR4VgQXsgs6buga9s4kqVaoQXfwfd3iEyHfv4YA4Z19DcmO/0HI8b3g6SUF9WkcRBzAV 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2smsk5ak6m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 09:53:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4M9rR4a038365;
        Wed, 22 May 2019 09:53:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2smsgsgmgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 09:53:27 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4M9rPFX004323;
        Wed, 22 May 2019 09:53:25 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 May 2019 09:53:24 +0000
Date:   Wed, 22 May 2019 12:53:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with
 less than zero
Message-ID: <20190522095317.GT31203@kadam>
References: <20190522082627.18354-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190522082627.18354-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=884
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905220072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=930 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905220071
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

No.  This isn't the right fix.  We should declare them as int instead.

regards,
dan carpenter


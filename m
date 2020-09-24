Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E9627693B
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 08:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgIXGt5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 02:49:57 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40704 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIXGt4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 02:49:56 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O6ikxk142961;
        Thu, 24 Sep 2020 06:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=uIj5VBDqAJ7IDZR0vUNFSWPpB3oh530+Qycp2L91Mbs=;
 b=srp7kE0YCO7QKsB1mhikqhb5vS9YWywczjsEdBFzuWrryx9hXxe0Bq6CHUly4pO3XKl/
 CvG6JggJ+Q693NTgdvOSOEmRiiKfZCYCOVAT3Qla1tZqOSWbSY04o+54OsHpwcCpqQjh
 waRRgXpqZKUeXJRJhJi9ktZjSww0J+8kIevAd0TmUjXqJyt7x98cyaf8muB8ZlpHpzou
 mZdcDenrCdhTiL6Vav0FqOFIss7c+k9QiK9mRAMcln+7/Hxhx4KAmB1KxdwEEP7p2j68
 OWrXBaLo8xWqMnKVleC+UXi2BH5K2T6/1ZxNcebB/zKmLXdjNzsURPjaRVNACP6TVb7X 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 33ndnupdb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Sep 2020 06:49:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O6jTDP016961;
        Thu, 24 Sep 2020 06:49:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 33nux2ajke-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Sep 2020 06:49:42 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08O6ndko026655;
        Thu, 24 Sep 2020 06:49:39 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Sep 2020 23:49:39 -0700
Date:   Thu, 24 Sep 2020 09:49:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>, pavel@ucw.cz,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
Message-ID: <20200924064932.GP18329@kadam>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
 <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240052
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 23, 2020 at 08:49:56PM +0200, Christophe JAILLET wrote:
> Le 23/09/2020 à 15:35, Dan Carpenter a écrit :
> > I've added Heikki Krogerus to the CC list because my question is mostly
> > about commit 59abd83672f7 ("drivers: base: Introducing software nodes to
> > the firmware node framework").
> > 
> > I have been trying to teach Smatch to understand reference counting so
> > it can discover these kinds of bugs automatically.
> > 
> > I don't know how software_node_get_next_child() can work when it doesn't
> > call kobject_get().  This sort of bug would have been caught in testing
> > because it affects the success path so I must be reading the code wrong.
> > 
> 
> I had the same reading of the code and thought that I was missing something
> somewhere.
> 
> There is the same question about 'acpi_get_next_subnode' which is also a
> '.get_next_child_node' function, without any ref counting, if I'm correct.
> 

Yeah, but there aren't any ->get/put() ops for the acpi_get_next_subnode()
stuff so it's not a problem.  (Presumably there is some other sort of
refcounting policy there).

regards,
dan carpenter


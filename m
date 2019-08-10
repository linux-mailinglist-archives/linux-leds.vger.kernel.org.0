Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9859388C33
	for <lists+linux-leds@lfdr.de>; Sat, 10 Aug 2019 18:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfHJQUJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Aug 2019 12:20:09 -0400
Received: from cp120.sp-server.net ([195.30.85.120]:40062 "EHLO
        cp120.sp-server.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfHJQUJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Aug 2019 12:20:09 -0400
X-Greylist: delayed 2304 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Aug 2019 12:20:08 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=familiesteiner.de; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sKTLfk8K9SjhDpUf4GXwgavY4u6umKfNFkXSIwX5Gyg=; b=pTemYD2wObtFALk/8QHRiYdFZJ
        Qnk6PJqmTpXeXkOBeaZB3Kj/UMyv+SdQE/iFPwE4juYBVpfTMtCIfbtKuhKnNCLKd7V+zeGxiFWZR
        aIYYjY+larFbC3Y7Est3rlpvRK9iuCnPmzrbmbX+o0l8Tki66h3y2snxMZzR+t2+8FGsK3hyFvzG6
        rESBs8xInTybfvBkDrf0AHbsaxkNzsbT5gJVCZYcRboycxrhB5VCa7On7u0lVI9svlMA7N+ygYopH
        V2NuEQCRg1GX3L7OsmjxrUCSpg45kuZUF92+QiQ1/x7Y0hfcC8Yqt7xh2xfJCCBpu/LmOIZV9xj2q
        aY7iq1cA==;
Received: from [2a02:810d:e80:408c:4a2a:e3ff:fe44:40d9] (port=36846)
        by cp120.sp-server.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <fsteiner-mail1@bio.ifi.lmu.de>)
        id 1hwTV0-0007gE-1g; Sat, 10 Aug 2019 17:41:42 +0200
Subject: Re: [PATCH v2 0/3] introduce LED block device activity trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
From:   Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Message-ID: <0c3fa931-bdcd-5e7c-3d2a-16c8d6a95d28@bio.ifi.lmu.de>
Date:   Sat, 10 Aug 2019 17:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1563807552-23498-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp120.sp-server.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bio.ifi.lmu.de
X-Get-Message-Sender-Via: cp120.sp-server.net: authenticated_id: steiner@familiesteiner.de
X-Authenticated-Sender: cp120.sp-server.net: steiner@familiesteiner.de
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Akinobu Mita wrote:

> This work is inspired by the report on linux-nvme mailing list.
> 
> disk-activity trigger not working for nvme disk:
> http://lists.infradead.org/pipermail/linux-nvme/2019-July/025253.html
> 
> This LED block device activity trigger works with any block devices.

I've backported/hacked this (together with the "rename LED_OFF and LED_ON"
and some additional patches) to the current SLES 15 kernel (4.12.14)
and can confirm that it works great for my Thinkpad T580 with e.g. the
FnLock LED, as well as for all our office desktops, using block-nvme0n1
as trigger.

cu,
Frank


-- 
Dipl.-Inform. Frank Steiner   Web:  http://www.bio.ifi.lmu.de/~steiner/
Lehrstuhl f. Bioinformatik    Mail: http://www.bio.ifi.lmu.de/~steiner/m/
LMU, Amalienstr. 17           Phone: +49 89 2180-4049
80333 Muenchen, Germany       Fax:   +49 89 2180-99-4049
* Rekursion kann man erst verstehen, wenn man Rekursion verstanden hat. *

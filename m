Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6285323CD91
	for <lists+linux-leds@lfdr.de>; Wed,  5 Aug 2020 19:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgHERiX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 13:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbgHERfy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2020 13:35:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F9CC06174A;
        Wed,  5 Aug 2020 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=T+Pnxyl6fuTgoOgOle3vLqMI7GDh1RdcTdr4sjnaYJc=; b=ohsUMyyotUDAXfhyKEix1yHvq1
        hVrkEYr48HhbHXDjVj7C1WMWLCQ+C62ZDnMe/7Mop80dLJ0aKNzPwA6zIydMXXohLVu7LbBhrCX2U
        Au3lTK43PlqODN/trMtouXiBG+pE9m0hQQ+SZD6iDR7bcNGqeVT8nqOXhwa5UyRSDYl3PW5YpbsuH
        7dlrFzGwYgEkECrkbtn0DezDj1XEd+JdMtShsF+/mgFBgqZSYZggvr+8/D4vYObdhn6b9yrBNKddG
        wLRaryCZF2oYc/1cmBTIKMn5GSwwcSMLw4CIKg8qgdzI3urQKuN17zdYvTXhfimNyZODWBNuv08ZW
        pI/J+WTw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k3NJn-0007v6-I8; Wed, 05 Aug 2020 17:35:13 +0000
Subject: Re: [PATCH] MAINTAINERS: Remove myself as LED subsystem maintainer
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200804101525.7235-1-jacek.anaszewski@gmail.com>
 <20200805172735.GB1118@bug>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <83c54446-0ab8-7c5e-412a-564ae92b4c98@infradead.org>
Date:   Wed, 5 Aug 2020 10:35:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805172735.GB1118@bug>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/5/20 10:27 AM, Pavel Machek wrote:
> Hi!
> 
>> It don't have enough time for reviewing patches and thus don't
>> want to be listed as regular LED maintainer. Nonetheless I may still
>> give a review from time to time.
> 
> Thanks for all the good work you did maintaining LEDs over the years!
> 
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> (I'm not sure what the process is here, do I take it through the LED tree?)

That should be fine.

-- 
~Randy


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE082DE7D3
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 18:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgLRRIA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 12:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgLRRIA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 12:08:00 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076AAC0617A7;
        Fri, 18 Dec 2020 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=VDkL11qZbOCFR2ZgsJ37HAAWx5+oE5S2tfVjNHUyKRI=; b=dPTZdGiT7ZP6fosgLqjU3x+sDT
        2+JJoLRWOEZ3HlgjYZkws42ehSJLwJyoEurBge/fv9jHdIQTTGJ1bcKnbNPUFTVG7b7vNwSZ5BmyG
        cXuieU9J9O3euvwkNcPeL4Jvq8fGwk2/s3GVFi7Ekh/13mRuQpn4g5pUF44mMr2UXSEOOBgYprwra
        2ofljaxg3w4MrHzw7mw9d70wbYTw/8NdOI5eSv7TDrdUEPFaZxUwDpRqnAkkqOgWEGs71R7A0jJYe
        8k3lnZJ8adnHWAIOnEI4PijqyihXd/aOGgKCchSTUdYahp3av4wuiIutmf2Xe2998GtHIJ0yi1AQ9
        /wbiBwEQ==;
Received: from [2601:1c0:6280:3f0::64ea]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kqJDb-0006lX-OW; Fri, 18 Dec 2020 17:07:04 +0000
Subject: Re: [PATCH 2/4] hung_task: Replace "did_panic" with is_be_panic()
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Pavel Machek <pavel@ucw.cz>,
        Xiaoming Ni <nixiaoming@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        dmurphy@ti.com, akpm@linux-foundation.org, keescook@chromium.org,
        gpiccoli@canonical.com, wangle6@huawei.com
References: <20201218114406.61906-1-nixiaoming@huawei.com>
 <20201218114406.61906-3-nixiaoming@huawei.com>
 <20201218125957.GA20160@duo.ucw.cz>
 <eddf7043-4bbe-7440-6c3e-ff272f722a86@i-love.sakura.ne.jp>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a2279e36-3665-6328-e515-b12cdc532aa9@infradead.org>
Date:   Fri, 18 Dec 2020 09:06:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <eddf7043-4bbe-7440-6c3e-ff272f722a86@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/18/20 6:36 AM, Tetsuo Handa wrote:
> On 2020/12/18 21:59, Pavel Machek wrote:
>> On Fri 2020-12-18 19:44:04, Xiaoming Ni wrote:
>> Plus.. is_being_panic is not really english. "is_paniccing" would be
>> closer...?
> 
> Or in_panic() ?
> 

Yes, or  in_panic_state()

-- 
~Randy


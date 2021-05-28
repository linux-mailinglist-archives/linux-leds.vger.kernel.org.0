Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CBD394097
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbhE1KFe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:05:34 -0400
Received: from mail.thorsis.com ([92.198.35.195]:48926 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236450AbhE1KFT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:05:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 80ABDF61;
        Fri, 28 May 2021 12:03:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nB9bIc_u7vGD; Fri, 28 May 2021 12:03:40 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 51DBD10A3; Fri, 28 May 2021 12:03:40 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: thorsis.com]
        * -0.0 NO_RECEIVED Informational: message has no Received headers
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bryan Wu <bryan.wu@canonical.com>
Subject: Re: [PATCH 01/15] leds: trigger: ledtrig-cpu: Fix incorrectly documented param 'ledevt'
Date:   Fri, 28 May 2021 12:03:34 +0200
Message-ID: <7558795.jS9KYa1WI8@ada>
In-Reply-To: <20210528090629.1800173-2-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org> <20210528090629.1800173-2-lee.jones@linaro.org>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

Am Freitag, 28. Mai 2021, 11:06:15 CEST schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/leds/trigger/ledtrig-cpu.c:52: warning: Function parameter or
> member 'ledevt' not described in 'ledtrig_cpu'
> drivers/leds/trigger/ledtrig-cpu.c:52: warning: Excess function parameter
> 'evt' description in 'ledtrig_cpu'
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bryan Wu <bryan.wu@canonical.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/leds/trigger/ledtrig-cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-cpu.c
> b/drivers/leds/trigger/ledtrig-cpu.c index fca62d5035909..8af4f9bb9cde8
> 100644
> --- a/drivers/leds/trigger/ledtrig-cpu.c
> +++ b/drivers/leds/trigger/ledtrig-cpu.c
> @@ -43,7 +43,7 @@ static atomic_t num_active_cpus = ATOMIC_INIT(0);
> 
>  /**
>   * ledtrig_cpu - emit a CPU event as a trigger
> - * @evt: CPU event to be emitted
> + * @ledevt: CPU event to be emitted
>   *
>   * Emit a CPU event on a CPU core, which will trigger a
>   * bound LED to turn on or turn off.

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex





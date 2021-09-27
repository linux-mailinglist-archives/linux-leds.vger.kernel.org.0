Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F150419BBD
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 19:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237142AbhI0RVt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 13:21:49 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58082 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbhI0RTq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 13:19:46 -0400
Date:   Mon, 27 Sep 2021 19:18:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632763083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PQ8MJnCl6i9Uv3bIn2DPH9KjY9CxteVJs2oJUIIZNuc=;
        b=i77K2tA8bdxNgvk6SnTha8dQz/m/GV368j4eSwrqmSYSj+UxAEcd7d53Yz8HbtT7FzSu9b
        tdr7fxh6hjkLXgwoT4rTGKTtth3m4GmlNXofZ+7RTGhwAAMDQVoq4bmEUvqp1pbtDkB0U7
        JFXWtOaL2Bvwan10rhwGLahdIB/McS/rTx3iZjn9rAMaUROkrfPK4vTjMLU2LAdhxgV1eW
        t2gI9e/hqx/cYIm2m69uQPn7DqoZxvTPhTTVf8/6acQw3v2ixAGXkAjzlQnrRX0MtZ2LHp
        /WW0BJYVtp8UutaBmNHyrwaI0iJNj3No4enOwtWL83BSNT0DZmjvpIYZRgY5Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632763083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PQ8MJnCl6i9Uv3bIn2DPH9KjY9CxteVJs2oJUIIZNuc=;
        b=VpcvKtHD2zt4jrShON9r9e/bkHzAbGKbBQSlOinxKcV2yqNKvlebeiv2Pi8LPsJvsyed5R
        8rqFddOMLk4WKDCg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210927154451.GA17112@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-09-27 17:44:51 [+0200], Pavel Machek wrote:
> 
> Would you mind reading and responding to the rest of the email?

The patch you mentioned,
  https://https://lkml.kernel.org/r/.kernel.org/all/20210915181601.99a68f5718be.I1a28b342d2d52cdeeeb81ecd6020c25cbf1dbfc0@changeid/

would remove the lock from led_trigger_event().
Are there any guarantees how many callbacks maybe invoked and what kind
of locks may be acquired?
Leaving kworker usage aside there are still things like spinlock_t usage
in input_leds_brightness_set(), nic78bx_brightness_set() (from a quick
grep) which have the same problems.

> I'm not applying this.

I hope you reconsider. It is not all LED usage, just the CPU trigger.

> 								Pavel

Sebastian

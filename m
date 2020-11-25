Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE07B2C42C6
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 16:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgKYPUr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 10:20:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42096 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbgKYPUr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 10:20:47 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1khwb7-0007KL-Dc
        for linux-leds@vger.kernel.org; Wed, 25 Nov 2020 15:20:45 +0000
Received: by mail-wr1-f69.google.com with SMTP id b5so886106wrp.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2020 07:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1MLMHISOaIgeTutRvpuwhXxO602bfmP5K9rHz4FiRbk=;
        b=TBOQINOdSkoh+RUys2YNsFMjIKQjfHFG++mf5+C62F4CP4CH5KZo5Kk30e8Slckld1
         m2hJKvHeUrJDWQGoFDTHSsSSvtGRpugj+UwcLWUf3NLln4WuoD6sBVbLjHV4JpnL/9Zr
         1lvuxnSD7dM6zKHA6o46v79aFV0SJAzAhBts5stfSTPBAWDDH64Xd4xc1AmLD1OOuxIH
         6xRzxUJvMKwgNer9SjkyeRfyIXz+qqhJ/JI25M3bbX4QQOi52QFLLIldc4MqEvjE4LBp
         5zFZM0xIwx3fUgva2xwThqOHo8tuziEx1rm5UGlMKDBPz/V/jvJ+wIs+3/yp1wYbryaa
         qF8Q==
X-Gm-Message-State: AOAM5339A6S6md7189VQyokkAy+ZmVLxctubF71QJbEcFjw/2b9IDHuN
        0fPmQaUyq6K+dIwVWRoSJO8Azsskm4IpkiMfphI7XvREjYdrVGSCIyOkTcc/06iTq03r5E3bkty
        5rIrbrgB7Nf0mJkaxyZXX3ww2fpEr0JeKafvdIRI=
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr4622242wmh.106.1606317644471;
        Wed, 25 Nov 2020 07:20:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNl3QW6kYs2TIKJGqJ7Hpd3zDYSdJfygEszsCEVOuPl+mFLvTEXyKWiO90gc5dVPV8CMfqbQ==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr4622220wmh.106.1606317644221;
        Wed, 25 Nov 2020 07:20:44 -0800 (PST)
Received: from localhost (host-79-35-122-236.retail.telecomitalia.it. [79.35.122.236])
        by smtp.gmail.com with ESMTPSA id i11sm5262891wrm.1.2020.11.25.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 07:20:43 -0800 (PST)
Date:   Wed, 25 Nov 2020 16:20:42 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20201125152042.GC73489@xps-13-7390>
References: <20201102104152.GG9930@xps-13-7390>
 <20201125124648.GJ29328@amd>
 <20201125141517.GA73489@xps-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125141517.GA73489@xps-13-7390>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Nov 25, 2020 at 03:15:18PM +0100, Andrea Righi wrote:
...
> > I'd hate to see this in stable 3 days after Linus merges it...
> > 
> > Do these need _irqsave, too?
> > 
> > drivers/leds/led-triggers.c:   read_lock(&trig->leddev_list_lock);
> > drivers/leds/led-triggers.c:   read_unlock(&trig->leddev_list_lock);
> > drivers/leds/led-triggers.c:   read_lock(&trig->leddev_list_lock);
> > drivers/leds/led-triggers.c:   read_unlock(&trig->leddev_list_lock);
> > 
> > Best regards,
> 
> I think also led_trigger_blink_setup() needs to use irqsave/irqrestore,
> in fact:
> 
> $ git grep "led_trigger_blink("
> drivers/leds/led-triggers.c:void led_trigger_blink(struct led_trigger *trig,
> drivers/power/supply/power_supply_leds.c:               led_trigger_blink(psy->charging_blink_full_solid_trig,
> include/linux/leds.h:void led_trigger_blink(struct led_trigger *trigger, unsigned long *delay_on,
> include/linux/leds.h:static inline void led_trigger_blink(struct led_trigger *trigger,
> 
> power_supply_leds.c is using led_trigger_blink() from a workqueue
> context, so potentially the same deadlock condition can also happen.
> 
> Let me know if you want me to send a new patch to include also this
> case.

Just sent (and tested) a v2 of this patch that changes also
led_trigger_blink_setup().

-Andrea

Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C93E560477
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 12:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfGEKaK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Jul 2019 06:30:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37527 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbfGEKaJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jul 2019 06:30:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so8822302wme.2
        for <linux-leds@vger.kernel.org>; Fri, 05 Jul 2019 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MR8qrrLzz1ee0JQetWcmCrqB1Zhi9MpQBveeGBxIzn8=;
        b=OZa6F+Ua55bJVrO2vEtkAOaJIkayk3hKsgKXfjMjIEqrl21aUvdj0yr81GuNGWuUn+
         X6okF+VgbwxcQjKD44wbj7XJO1UGOzBsE7A9xQ4xJNVV1KZrBSi7tPSWgxDxC85AI11W
         qQE9PlaSMJz8oQiQv6nL+hdwDqyWPV9c89RTpvKcvDQCGO2PmOmusRVZ0HowA2bJ9XM9
         RLR8t3DTMADduoe+uYn4EXsRdQPP08xx6yFfoVE5jXIDpwW4H2M3YwawkXB6c9ZfyJfs
         rTrXzsguklz4vk8ZCE0AdWTXLGS1JyUpD0U01f4QA9RkiYYPNtr3BeKQitVC+gKSuiyH
         uVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MR8qrrLzz1ee0JQetWcmCrqB1Zhi9MpQBveeGBxIzn8=;
        b=hIhUY+8+nP/bJh6yvKZYnDouNSAiJ7IYHWGEBgInUSYkMGQzu3VARlqUi1gn9PvWAP
         xZFqKW1VGxtuAAENhI1uhd7Sx8coZpaHcvl3Md7K3bEEBqPL2JH7AsU2U2be8fAIyZUs
         sNRsAo6sHwKvTqVrdP3Bp4peVQHZ5mKZzZzzdrY+F+Wioit0zxq2osxBQYyurmfnOcAv
         NEzeBiKX+GbGQpwiD7JI70FrSwgy/tdcSIam1ZvRooEM0oUNjA/cmi06ox949HhHVnS9
         bHTiKvZzdCZhiKbbBxmfC1GC1KLTfKxa2GsdrJPbeFQ2fipeE8BbgGE4M4DSNVNf2rZK
         BeDg==
X-Gm-Message-State: APjAAAU1YYhUor8J0F4RioUo7xUfdNTZAkx2TsYD2FJlXixxME8iYX3T
        FxbEjbSXk8/CysGjtDa7RsqaRg==
X-Google-Smtp-Source: APXvYqxY2gEpA+xkxp2cQs9p2kb6x6zZLLaKq7ZvIatk9EblUmS/qLnLyEGcoK/mMsScXPadH1rv9w==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr2991912wme.177.1562322607796;
        Fri, 05 Jul 2019 03:30:07 -0700 (PDT)
Received: from holly.lan (82-132-213-94.dab.02.net. [82.132.213.94])
        by smtp.gmail.com with ESMTPSA id y10sm5524508wmj.2.2019.07.05.03.30.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 03:30:07 -0700 (PDT)
Date:   Fri, 5 Jul 2019 11:29:59 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org,
        jingoohan1@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190705102959.cmqhzpzikqjsydlx@holly.lan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190705101434.fw5rpctnqt6dwg6e@devuan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705101434.fw5rpctnqt6dwg6e@devuan>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jul 05, 2019 at 12:14:34PM +0200, Pavel Machek wrote:
> On Mon 2019-07-01 17:14:19, Jean-Jacques Hiblot wrote:
> > This series aims to add a led-backlight driver, similar to pwm-backlight,
> > but using a LED class device underneath.
> > 
> > A few years ago (2015), Tomi Valkeinen posted a series implementing a
> > backlight driver on top of a LED device:
> > https://patchwork.kernel.org/patch/7293991/
> > https://patchwork.kernel.org/patch/7294001/
> > https://patchwork.kernel.org/patch/7293981/
> > 
> > The discussion stopped because Tomi lacked the time to work on it.
> > 
> > This series takes it from there and implements the binding that was
> > discussed in https://patchwork.kernel.org/patch/7293991/. In this new
> > binding the backlight device is a child of the LED controller instead of
> > being another platform device that uses a phandle to reference a LED.
> 
> Other option would be to have backlight trigger. What are
> advantages/disadvantages relative to that?

I spent a little time thinking about that during the recent round of
reviews.

My rough thoughts were that LED triggers would be a good way to
handle it in the kernel code and would trivially solve a backlight
composed of multiple LED devices (since all could attach to the same
trigger). However I think it would be difficult to use the existing DT
bindings for triggers to express things like brightness curves and to
handle systems with multiple heads.

I'm not *too* worried about conflict with the existing backlight trigger
(which isn't actually a backlight... just a hook into the framebuffer
code to operate a binary LED). People like Daniel Vetter are
labouring diligently to get rid of the notifier it depends on so turning
it into a proper backlight device would probably help with that effort.

Anyhow... having thought the above I then shook myself a bit and
figured it was more important to focus on sane bindings that on what
the kernel does under the covers to realize them ;-) and decided to keep
quiet until the next set of bindings is proposed.

However... since you asked...



Daniel.

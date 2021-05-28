Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110FE394072
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhE1J6b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236417AbhE1J61 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:58:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2DDC06138B
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:56:50 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso6460649wmc.1
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rLcRko7vTBkfD6ClMWD+JGFtnLvq9byhRpGvRT6Rq+w=;
        b=kruQNAjVubk9/aUgFi76/NLAojKcKZ/shIV3CLQKM6y+J61pSioemXQLOpovxkZi4L
         9eawNQPdEag6gfq/gzOLcrYHqGon4j9NWh9cGSL7HcW93pcMPoFyMnaTUte3/RJzUppv
         dN1LmcGscVktw2Ym2dz9IYy5TwVJPZkqEiwwWe/9TaeWF93SzeKvmYVMJAAVXTEMe8Um
         DuV65cAlnxlhuR+IayubUqsFnzcTLeAmtO26F5svOGRBGen2zsyj7IGIzH2wiH+wEzqw
         Hm6idHQsC+BVpfWKRrREBKUQC1gJoVwz/9NeOGvNEjFKFcO32Qv2gyPWNw5ahwkoyvqf
         vlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rLcRko7vTBkfD6ClMWD+JGFtnLvq9byhRpGvRT6Rq+w=;
        b=Y84MjDdZjY8hVa6KazSLepnIdiGVx2URJxK30wrLWqpAllqNZBlhxeZU2Gd0QPeG+d
         dITYTgtnjFnzrC/QssITqXt7b43W/mEqmajoMNXrtowyOTSiePIzgqhzXUbMu8lDwDk9
         MwManUNNrqD+lGiyBMXI9VTcl/uixyw91RYF6ZQTQVlJVNJDe/NSDwiGVcyFWSyxRwKe
         KkSx66bFmO1N/wLbsjmJ5N/n8gADAHl0wUTBxFjhwe6tf3ov9q4vx2+NlxvCNEuPBQs1
         DDSgBf6ZS8gRwBKdM6lFtJk4kS1ir4ofGk860WtMz+19NYeheTrT3fpjkVGf4Trt2lm8
         gPdQ==
X-Gm-Message-State: AOAM532Awx5l0P2/imkoPl+39GRsWK/Dt2UAMwTxFwuavgHMrVy0bS0v
        xBFap5+5pIo19mP04xNHvE+wcpBXg+OAjA==
X-Google-Smtp-Source: ABdhPJwSHeI8Oo/6vEqcqbmcNvvZPcF4bh+WP8RS5TIU8HG3/zLYhvuIpY9IHV3+jm0/TblgHavqwQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr7498380wmq.38.1622195809277;
        Fri, 28 May 2021 02:56:49 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id x11sm6368061wru.87.2021.05.28.02.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:56:48 -0700 (PDT)
Date:   Fri, 28 May 2021 10:56:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 14/15] leds: leds-lm3692x: Demote non-complete kernel-doc
Message-ID: <20210528095647.GQ543307@dell>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-15-lee.jones@linaro.org>
 <20210528093921.GA2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528093921.GA2209@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 28 May 2021, Pavel Machek wrote:

> Hi!
> 
> > Needs updating by the author to re-promote.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member 'boost_ctrl' not described in 'lm3692x_led'
> >  drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member 'brightness_ctrl' not described in 'lm3692x_led'
> >  drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member 'enabled' not described in 'lm3692x_led'
> >
> 
> I'm not taking this one.

You didn't say why.

> I wanted to take the rest, but "leds:
> tlc591xx: fix return value check in tlc591xx_probe()" did not apply.

I will rebase on today's -next and resubmit.

> I took the rest.

Thank you.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

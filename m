Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9609300F14
	for <lists+linux-leds@lfdr.de>; Fri, 22 Jan 2021 22:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbhAVVm5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Jan 2021 16:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbhAVVlB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2021 16:41:01 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D789C061786
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2021 13:40:21 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id v67so9581174lfa.0
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2021 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVQGipISqL+GidmgskuqE54mrZNWSegyyQUFD/qGixM=;
        b=DBYc+xh+//BuisFJO7Qj1/JPZY3GmA6Q6VyAQhmchMrcnNdQgI3jZFePMXCHUuaEGg
         5RGO80cSZyrTGMfD5NST6y8FzE5ZHd23XF5yoG3UYaBQDzFj4EBslBBv+RMkVdaje+V7
         1w8G104HZiAVP9Xw4H9rO76cPe9oNYOh3DJhL4jOXrv0KPDJz0j53J/JhIHOT3M43fAm
         w0FEQ+PVt5C4c9c+XLzX44lm3z0UUqXZrPr489pWycIYpyiq4GPqoBcsQfZi8tPWdPI3
         PJGhLhoQrjfWBxZf2vgIATJgsgdEu5EAdBl5KswwMCDnuF9udk8RL7pcv6HehjvmkuOr
         eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVQGipISqL+GidmgskuqE54mrZNWSegyyQUFD/qGixM=;
        b=nxvi4xh0I9jiPVAI1LBJ6BKNsHGt1Yzk8EvNAEtWRZGPtzNvhLBRgcdD7qp15S7MFZ
         tftVsRc3OkEljnnmvZVL9ITIAAvtMQN/QKgELiAQGn89/xX56xDPvseYTIpoaJoRePnI
         d04MFoFhHHbFjBHRLkyB+ykExxopemCGQ0ttDflfFFtSu3UnTdt2RGJ+w4Hyf+BVeIV8
         z0maCR/rBUf2eSGAKEJdJTP0hFG9sh07R3xgf7i84ytSrBDKyptUFqVXL3P4xulXh95+
         GNexBKq5QiJ1nchZQGFNInvgdco13qnIxiQQddN4SyzE5d0ndp2Ls4iG+9JsM7aoa2sY
         /SGQ==
X-Gm-Message-State: AOAM530IsPA/fMu/4BTHL7X0NU8PQg9iIFugPlRuT3QHJLvbtSeqHo4g
        8GwYtaWIigFb5CKSAt4z+P1qeJWKzZ+4FLF+6UUQ8w==
X-Google-Smtp-Source: ABdhPJxfbwAudp1weWzfAaiCkKvD4TAjwf6Rim6UybIVL3cqXpXKCe6HdRAIpeeYqM+DRPelpzMSFkQEYdi9Ys2JH6I=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr3247513lfe.29.1611351619532;
 Fri, 22 Jan 2021 13:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20210102231510.2068851-1-linus.walleij@linaro.org> <20210102231510.2068851-2-linus.walleij@linaro.org>
In-Reply-To: <20210102231510.2068851-2-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 22:40:08 +0100
Message-ID: <CACRpkdbihCo+OYuu8ffokOO=eXeTDAYG1k91dFh+2HGh0jQCWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v9] leds: rt8515: Add Richtek RT8515 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi LED folks,

I think this version has covered all review comments, at least it's been silent,
can the driver be merged?

Yours,
Linus Walleij

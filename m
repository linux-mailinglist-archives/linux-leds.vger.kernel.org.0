Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5805D40BB00
	for <lists+linux-leds@lfdr.de>; Wed, 15 Sep 2021 00:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235348AbhINWPS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 18:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234956AbhINWPR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 18:15:17 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB09FC061764
        for <linux-leds@vger.kernel.org>; Tue, 14 Sep 2021 15:13:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h16so1585643lfk.10
        for <linux-leds@vger.kernel.org>; Tue, 14 Sep 2021 15:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JWsTCdHYGd/aJ+PxtTnWChkbPZ5sbeK96OrviSNN3s8=;
        b=JwI9vP436C/kVkfUnMuUGF+nI4pwVjPPhEoYpHVyjC6EGPiJv+o1dTFRN2BzmBU3V4
         EFFigSIycU81Epm9FYDl8VXTUYBK94Abt6JH3NzRFHzQjqNB8+Xc85rqKExn/7wtwZ9S
         1pepJ65JI72LsWybw/vCvgtEqajrodwo4swId+LSjCBPfV1GdO9k2HaDOnW2jPNMJgYb
         CJLrmqwxBt/mVUwJmbdjcNK5WmsCwEyziri5Oa5TsCtutle5iOXW3uaRUMpZOOxPGC3y
         sFFYKLqsPpl8TFxyjNMvtL+5wHWLOECkG5cAa8mC4zVs9IHEMzq2SVXrkN3AX4PUeZvP
         oXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWsTCdHYGd/aJ+PxtTnWChkbPZ5sbeK96OrviSNN3s8=;
        b=37mzUDrJ/sKBEhq7QQvvdauQnIvLgoCniZRX//hwu9UvO9ruj3WaAFQuupdgadQV7W
         qz8vqr06WWhMtGXpESdzrJqwAyAo8y2l8Qjym2q4pFz8NJShq0mrJQTaweuSe0k3wqEQ
         jXAT+yH61vxHY7dqPSd7DnrfVAY27TCNCoBf56V5BVi/Q7B2orL/gsUczw0M6ChO3yie
         SG1htwnCwag42OP+1iqzoN1t+MjiPs7Eg3tdzF97Xvftc4wTMpRknneRpUsxEbJNBeAs
         e2y5ja8oGX2nLDNvRSsBdnNiA8oI1WhH3onDIFrlpe86gNqwPAoBAomV3yG4ESK1BINg
         4ODw==
X-Gm-Message-State: AOAM5310+p9VbhgdYJOmqyvMiPHiTCmt5a5CiWQaG1o+om6BilhX6uYa
        /EyVUEwYcEv0tN3xtjkL7simRNgUwcOhu+i5ff0Jyw==
X-Google-Smtp-Source: ABdhPJw++97HufaRBpmc24LoXmsRYCQ4n4TAIcOI/0662lI81pQdxcBwCQcnx6Q2PmqquC39Np2lofu+7pCvVqvvHVE=
X-Received: by 2002:a05:6512:3096:: with SMTP id z22mr14628711lfd.584.1631657638198;
 Tue, 14 Sep 2021 15:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-6-robh@kernel.org>
In-Reply-To: <20210913192816.1225025-6-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Sep 2021 00:13:46 +0200
Message-ID: <CACRpkdaykxaECTH6nY4Z-k0qwxq+-o28O=OUqNR4fDRxD0P0zg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] clk: versatile: clk-icst: Support 'reg' in
 addition to 'vco-offset' for register address
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 13, 2021 at 9:28 PM Rob Herring <robh@kernel.org> wrote:

> The ICST binding now also supports 'reg' in addition to 'vco-offset' for
> the VCO register address. Add support to the driver to get the VCO
> address from 'reg'.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

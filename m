Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7DA2B6C6D
	for <lists+linux-leds@lfdr.de>; Tue, 17 Nov 2020 19:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgKQSAJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Nov 2020 13:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgKQSAI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Nov 2020 13:00:08 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741ABC0613CF
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2020 10:00:08 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id r17so25309174ljg.5
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2020 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UL81rwXcfbyusrE2QAmwq30h1yMrtrFOVYAuzQEKqis=;
        b=AoiQ74SNR+8Tm50Y+Qr5w01hgvui8+bo0BQSUel/fKzvO347Sq0+FU0GwHazApvqZr
         pkwf26jpWpglpYFKAmCM3c0z9AaikljMn3jlFtT85MZiyJzytAZEpl34lekvS5CyFwmM
         yOKaJcMYH2gLzR6cX9pLh/dnDakRMAANg62kVaRTGWZ854UkSTqOkDfWYxDFNjzJIuog
         26q70ZfIW/ogP6qs3K2/PlIsQVb7zyiUzfD1xd2PsKE7zRtxl3uRLXhDd/soirkjAu+P
         UrC7Xq640rNh2CfOdNbRGWqpZrjoZ/XlfOmK5cQ/EVr2hZ3koEXnBYM6j4eyfzwH5w8i
         XtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UL81rwXcfbyusrE2QAmwq30h1yMrtrFOVYAuzQEKqis=;
        b=mhBVkPyzDBzJecY4K28JWpvCbbyOGjYgoneMvZnKqdYYWt2MQcOQgvkNR7JuCAO8cm
         AXed1T/qgby6InhCFOqSaa4YguYpqPTuL3HAF7rqaaLtuOdeu4ckg2gwXVwzsxKm03Pz
         e0O0IfrUdbMAbhE3/gEecB7XvuxHn/oXn2yDGvpA/7p/FlRo15Me1p3tqA9immOdniQW
         7RkDAWDUXU5XBoYD8bf+YbtDVOZyUdQ8u47ARP0qOfS7fAHArpWH4+itx2sUoqMfcLlW
         EFb9wPw0mjanIVRxwUleKQi4HBPVS8RbCSrUpAz9Myx55hEmdmybXwKrFTB0J3m7F3F8
         LDFA==
X-Gm-Message-State: AOAM532AAefrZvC2jQm2N8Xb8WbtpL5qJFuMG7areuFgh7uDmoKak5ge
        aIR1X7eyTcpiUsqCD4lzFXft89WDHSyvtll9ILz5Eg==
X-Google-Smtp-Source: ABdhPJz9pbSO1bvBKMQf9hNngCUPe/9hMg/wrGmoD5lgT38hr+pU9clV3sQiI6mLMYfkK6pUR6v2mmcn7N56Mmg671s=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr2607908lji.100.1605636006789;
 Tue, 17 Nov 2020 10:00:06 -0800 (PST)
MIME-Version: 1.0
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
 <CACRpkdbGs-LEWie2uzZEHxrac-0tuHqRtdDP0D22KnXKQ3rqGQ@mail.gmail.com> <CADiBU3_C2J0p-gWx9KyZWXqX43VAn+bh6ac5TgvPp9xK9HjSQQ@mail.gmail.com>
In-Reply-To: <CADiBU3_C2J0p-gWx9KyZWXqX43VAn+bh6ac5TgvPp9xK9HjSQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 18:59:55 +0100
Message-ID: <CACRpkdb_WWYHKUYWUO1T32fV3T3wLGe5G9D65ejrUgwEo_=XwQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 LED controller
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Nov 17, 2020 at 2:10 AM ChiYuan Huang <u0084500@gmail.com> wrote:

> From linus walleij's mail, how can I support him?
> Or just  wait my patch to be committed on linux main stream?

I think it's chill, Lee has a good habit to sync with other
maintainers with immutable branches, so the LED maintainers
should be able to get something from him to pull once he is
happy with the series, then I can rebase my patch.

Yours,
Linus Walleij

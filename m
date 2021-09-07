Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73AC402F5A
	for <lists+linux-leds@lfdr.de>; Tue,  7 Sep 2021 22:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345921AbhIGUFJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Sep 2021 16:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345768AbhIGUFH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Sep 2021 16:05:07 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD63FC0613C1
        for <linux-leds@vger.kernel.org>; Tue,  7 Sep 2021 13:04:00 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso591773ots.5
        for <linux-leds@vger.kernel.org>; Tue, 07 Sep 2021 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TENBxfXEJrx+qep0klzFIcnjVwFP7TPiqnVMsNGOBug=;
        b=luEnDOJzvHQwGgL5oD/itSmHJe7C1R8V4a5IViGtADCVgsKgv2TIz5DcHiy+iE4r6u
         bWh+QkKk+u6tXj1AWln+ED05+Rwx/rmFH/+1Sjo3DIoYMNbGAFlSsH+57UAU2rRcpJOX
         Epw4H7JiE9KFLKbohz7Mi5DLhuFL0WmF4H0QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TENBxfXEJrx+qep0klzFIcnjVwFP7TPiqnVMsNGOBug=;
        b=YXhg41QT2SDz5HXfdw0/tCL0IagfX8aTr4k5y2e652OtWLPaOepMLPDp59VoXrBBAy
         fLyyfBz81jWkx/j0JNiYB8shPweJm/nQupJ5lLS3AJeHQfIElvVFoT7YDoVmexcGCJ9K
         /3kFIz6M6ymqyyivr3uogT60JumXc79ghjFzSAL8zhxSMTFDYiZfVkEvmXGA+vQMTRfF
         2PEPoex/lNL4+AU7zn1XqEMQ8eP4znGmwjEj34qJ3/srRVYZNUqrwEvKciPrzogpvS5a
         U8RC2Gr6cymwfj0DeGKqrCghPuzXFLSDanZXIPdQFBJKhHjjNBlhlI3WM9HiIg/T7GMN
         wd8A==
X-Gm-Message-State: AOAM530VMuQu6GDbhIMOx/KMGsoGXdtw9/ubTKB/tyibqZugTIlzorIZ
        i8T6Bk6sRWP3N9wpWAF4uQGZTx3srE9JX6nLxOQcdg==
X-Google-Smtp-Source: ABdhPJy9i/DlZKOQrkekswUoYCNt7EYgkeC4BfnnDRyCvPE/fNG4JvccpBXSKKrzKRlyeS0taETaIPWq8jLCedHjcCA=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr102390otp.159.1631045040100;
 Tue, 07 Sep 2021 13:04:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 20:03:59 +0000
MIME-Version: 1.0
In-Reply-To: <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org> <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Sep 2021 20:03:59 +0000
Message-ID: <CAE-0n53RNDAykhFuDN_Qgwv6ktR8cRQOQxXWmDX9+yXeu4aECw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add pm8350c pmic support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     mka@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting satya priya (2021-09-06 03:41:05)
> Add pm8350c pmic pwm support.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

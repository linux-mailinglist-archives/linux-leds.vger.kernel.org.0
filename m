Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E06C67D5EB
	for <lists+linux-leds@lfdr.de>; Thu, 26 Jan 2023 21:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjAZUHm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Jan 2023 15:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjAZUHm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Jan 2023 15:07:42 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EEA3E095
        for <linux-leds@vger.kernel.org>; Thu, 26 Jan 2023 12:07:40 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id a9so3446907ybb.3
        for <linux-leds@vger.kernel.org>; Thu, 26 Jan 2023 12:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLvduNoOt8LztTYVpuNMVnPelMmnqyRxqRLyg6HGxcg=;
        b=H+6SnUs6VnnGPZqMii9E04B2jZbdPO8JEzKwKb/AJ8KxiwwnK2MNII3exjLOSl5gid
         77VoL20WxdjPiAd6mM/Frt++DnvRBGeYkCnMZxJPaMaSvtgB/RUnrDdxLVgKkeveSvqV
         LrzyjFLEy9Ju1waaH1L59m7AUNdOGsFP/ugRIHnpl2AenIYyj6LEgFSvN6LFq6cNKlEq
         E2X18z1uBxOTst1xMvqGuCwKxTd4bVYXZAD93G/mIzNmkdajWluOkGUV1vYYnY3i2Fdw
         fllbaK801dFQ1i7INkpwSx52GZBr7tIxG6tWtQsCZln8/tPnjiETmnRpLougqogGIAL/
         B/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLvduNoOt8LztTYVpuNMVnPelMmnqyRxqRLyg6HGxcg=;
        b=rO7ul722zG8Vadc2noqBwJWTaVt5C9I8IzDdwCZuNnXZimI0LmgjZUSoKnfZ7ghHP2
         zQ66OVpMKvtCUy29vHmtUHXjaB+X8gXdxpeE+oKoQ2CwS5MzwI/WWvsyNYd37j0yN9EU
         XxGcjuTqrtAlr3GFjIt1KHe63lPDtciOwtIH+35+TinML8TVBic/eNTrXhsLy3P8eqSR
         vvDZTFaxI3fBTo1KNtZmmHfXUVOoFhnh9W6w/yIoN29E6avqh47Jm15/kmDbVdaom1lV
         t+Uv+Ci4GEtAxiNsMrEndHvtdmtviyFOCn1cFVysNLHXmNOwr/lKWrm9pAkDHQMYvYM9
         9NwA==
X-Gm-Message-State: AO0yUKUrJyVHT7jR1Xl61aWOgvsOL2WyZ+NKH1TRJOuYskCJukF6IR1H
        1LrkReYq5Pb9xb/eO/rP/ALi2DV33Z5NNmsd869tMw==
X-Google-Smtp-Source: AK7set+RXU546bCG2ieA1RNematBemc4AFyAycDDxbMQYNdnjp7iUSmTGAk1mBuk641lDSfvZ/bqCOrkZeydPqsG8fw=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr881734ybd.24.1674763659341; Thu, 26 Jan
 2023 12:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20221226123630.6515-1-pali@kernel.org> <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
 <Y8rMJcX0cqThKj2N@google.com>
In-Reply-To: <Y8rMJcX0cqThKj2N@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 21:07:27 +0100
Message-ID: <CACRpkdZrL3Wpk6_Pka_Ye-9C0Ewx5ULZ8pt396kO-e95kqku_A@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
To:     Lee Jones <lee@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, soc@kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jan 20, 2023 at 6:15 PM Lee Jones <lee@kernel.org> wrote:

> If everyone is convinced that applying these drivers is the correct
> thing to do, I'd be happy to (rather) take them via LEDs.

Oh you are co-maintainer of the LED subsystem since a month!

Sadly this series stalled way before that, so that's why we didn't notice.

By all means, pick it up!

Yours,
Linus Walleij

Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488A57E115D
	for <lists+linux-leds@lfdr.de>; Sat,  4 Nov 2023 23:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjKDW1O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Nov 2023 18:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjKDW1M (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Nov 2023 18:27:12 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9251D7C
        for <linux-leds@vger.kernel.org>; Sat,  4 Nov 2023 15:27:09 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-da30fd994fdso3758601276.1
        for <linux-leds@vger.kernel.org>; Sat, 04 Nov 2023 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699136829; x=1699741629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzIrycxZG1tOQv2mvfB/UubZm3MyTqIZcEqXJO3t4Ec=;
        b=CJBFig9GD0ALEp1NpOLTmxfnht2V3/fxUel6BJNHeoib7U0tlNoVVvWL3kX4AZ2JJ1
         1t+b4duQGagjlO0IpcTjne11GDRUZ9HOKzsBQBtwekP6wG7XN+Mlt2Ji8eyaEQgjSipk
         DFdCHHJHJBEX/cz66+Q2a3TIzVesQBH84Tql/JrK2bVIhYDURdo7pIi7WlWV8Rdg5fBR
         ICi09XkjlNoSFzND/J0GKTj449hBANB+9Wrsz1pszugHM/KWO35NmAFQTINXrwU0G+tk
         T2Hk4UOOo9TIDm1JPs9C4jr6iWZ2HnZCZA+ca4YrmT59XGlDCaAA+3EDTMKbei1V7lMo
         OPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699136829; x=1699741629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzIrycxZG1tOQv2mvfB/UubZm3MyTqIZcEqXJO3t4Ec=;
        b=DkR2u6rh4PRiXPKnD1ANI4PrS9vd2BhhUBXwoy1TQgr1tf6CzEQiFg2hzVQhExW5To
         X2T95E475d5p9WPRBuZoBCfilRDbO2PlX4vD3vEL/Z2LeIGpmxLHkHdTdFROBlA600S2
         q6YvrVtDL76ZTeK57W/NPQqriXs0BGhgt+5vVAXPB6gOGlgEpJTf2Sp5eT63jLxRdX0I
         nsuRDaKgTa+8AN6KcR1IC/TARQ93o+2oNz1Jg7zLRDK3wMj/gGKr2nkiOwXxeZ6yCEvh
         NH38HRs5MoIxPITb3zBBj5TSe6T0KmTNjS/qMUvxodCarCnK+n2CMqu342BXj4oAmlhN
         oNMg==
X-Gm-Message-State: AOJu0YxM4Fu1pQmw9pJDf97lI9xr7c+XRgBgo9mQJUxlV1Mi3mEh2l+9
        RhH8qkhurh9KMdC8Z8RD0Ea/WPPqO4WGZXib+T/aSQ==
X-Google-Smtp-Source: AGHT+IE8SiCwR3UCj9kGbkTIuetyg/dQsn69e3ZmJEbcMU/feHbnfsxVpaHYwy5vgVuTDkxUDgOpXiGPjQaLYj7b6KY=
X-Received: by 2002:a25:7689:0:b0:da0:3a37:61d5 with SMTP id
 r131-20020a257689000000b00da03a3761d5mr5905636ybc.4.1699136829002; Sat, 04
 Nov 2023 15:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231103195310.948327-1-andriy.shevchenko@linux.intel.com> <20231103195310.948327-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231103195310.948327-4-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Nov 2023 23:26:58 +0100
Message-ID: <CACRpkdYKYF7VMcMbiaXHrPjsvYCUjaUNPJXMdrEAWH5U377f2A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] leds: trigger: gpio: Convert to DEVICE_ATTR_RW()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Nov 3, 2023 at 9:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of custom wrapper, use DEVICE_ATTR_RW() directly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

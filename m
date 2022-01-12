Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F22A48BF8C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jan 2022 09:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349341AbiALIKt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jan 2022 03:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238080AbiALIKs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jan 2022 03:10:48 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8548AC061748
        for <linux-leds@vger.kernel.org>; Wed, 12 Jan 2022 00:10:48 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id 82so1642456qki.10
        for <linux-leds@vger.kernel.org>; Wed, 12 Jan 2022 00:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ln4Z+utk5t4wG7dSTr+N/vIytSHGiSk5Tc9SQNyOM48=;
        b=jRXNSagtG+3zCQ/ueepVM/ZM8F+fDU+KYJkYAXte5pXlSXGD9pne8SjP5bzXRhTgTr
         /LDmH+gdHv7f4ka7Fty9DPzim7kmqkCpYiSN6KQNDQ1L+UPPyG2am2s07g300gsYADGT
         AJb+btdFlbtttkdtoD0ebAkqEFyeO5ZOGo36O3wC5NiCecrGTlB1idrAmqutPEOfyWam
         n2rwJW/QZf1zc8D4/iVVtZbcNwIeE6AAM47bc7p45h7cvF0VojA9f3EwrNZAN7Pp7rug
         7ldZ/AEjhRU4lUkcoA5PoPuAYB5eWOFx3J/E/jDvDoQ4tw6dtRSx+L/Q35l36UtxOMOi
         uTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ln4Z+utk5t4wG7dSTr+N/vIytSHGiSk5Tc9SQNyOM48=;
        b=oqFQOOojNIlDzRX4vCdmiNjLI4EGK/DzfLC3VA0pa9AjcT5UOqDj7NVWHSATHo5Enp
         YCS9ot5exDhzCJzJvyQJ2ALAkbkLhloFZXPDipUQvVAPHFHHfDq/YYcU9iqyrGQ5FH0+
         xm4TZNy57Qg0TlzRYnupf7NpRNlOSZ2DLd6Bs8TX7JVoa3O+mZS1RMhoedeLDU0gP2SK
         6KDN5N0fSV28VpfObXm7R6qMuLNOtDxDRovGyJPJBxAUmzfQR7oOF38FqKv+3UV26uDI
         O5Yt25HV0EBUZeAF0UtE1ieFGFP6UnymD32uRs8A6ZD8aDtP303kVtKxTAFtVfr9M/sM
         lf3g==
X-Gm-Message-State: AOAM532P3JcoL/t0LpcR213DS4rlShJdbR+zQf5Y/ejIsZyHxIu4J1OQ
        wYbIw/Ix2T1KX/MKG/0wBr4hjbF4R+W2mDD2ZqDpwg==
X-Google-Smtp-Source: ABdhPJxgw8vuzvGsNpSUXyvXwl1oHkWI75DxxBdrzPmti4gBxsNpCUeqpRI1bGJFhSec2o2EMW1PEEto2AraQlbf+yQ=
X-Received: by 2002:a37:8045:: with SMTP id b66mr5682021qkd.670.1641975047533;
 Wed, 12 Jan 2022 00:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Wed, 12 Jan 2022 09:10:36 +0100
Message-ID: <CABxcv===MQp6Riutw0Cs=CAxX1k9fNZfcL+nDEuRHveXzjMQBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] regulator/mfd: dt-bindings: maxim,max77802:
 convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Krzysztof,

On Tue, Jan 11, 2022 at 6:55 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Changes since v1
> ================
> 1. MFD: Use absolute path to schemas.
> 2. Regulator: skip properties.
>
> Dependencies
> ============
> 1. DTS patch: nothing depends on it, sending here so Rob's automatic
>    checker won't complain about DTS.
>    I will take it via Samsung SoC tree.
>
> 2. Final MFD patch depends on regulator, so the two last patches could
>    go via Rob's, Mark's or Lee's trees.
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (3):
>   regulator: dt-bindings: maxim,max77802: convert to dtschema
>   dt-bindings: mfd: maxim,max77802: convert to dtschema
>   dt-bindings: leds: common: fix unit address in max77693 example
>

For the three patches:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

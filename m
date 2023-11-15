Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32BE77E1157
	for <lists+linux-leds@lfdr.de>; Sat,  4 Nov 2023 23:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjKDWYh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Nov 2023 18:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjKDWYg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Nov 2023 18:24:36 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48345D6A
        for <linux-leds@vger.kernel.org>; Sat,  4 Nov 2023 15:24:34 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1ef36a04931so1911970fac.2
        for <linux-leds@vger.kernel.org>; Sat, 04 Nov 2023 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699136673; x=1699741473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xcs2HjG+fgSYQEQB0XJ0QSMbYKmU2xrcdBawACdXBo=;
        b=F+H4peC47DpqQUoE1X7qjJ33NKUKOJPgxfTIRBV51YeTsEuTdihzIze1gnV/FqSzNf
         XYopchOpoQXoksdQt/l33wZP6K8Mu1gxVnm9V0JISDw5o+LAFndwE5ArOpwEnF6/D6w1
         iZY3+SeFe75d/5PEGGnKDEECozCtDpTqkqpmVTU8WFf38/F9k670rxU9xOtm42h3SWiN
         NmZV7OrnGGPZ2ru3KZ2GXgNbtQTVVqmBI8Nj2E8qrLoi4fdpC35EG0FntrhGDPCgGlEa
         tFCoyrwGOE186MiD736gShuyYi08xvced4XvvIsRns58ncQoStsoeWJGychDfLk4OVmS
         E3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699136673; x=1699741473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xcs2HjG+fgSYQEQB0XJ0QSMbYKmU2xrcdBawACdXBo=;
        b=WyLEMNoGH9MlC877kfSBfPdLF4ow7t7TG16xIYI/xazpgDG84ihUlFQy9SkwP2hAEi
         ghIlqvLx2eZXHXaVSe75oUaobS4YgigW6CsZ9f8TQzLvzV1CmoYzXnJrWzvjU6shKrnD
         UY7wYsKLPkMayi7PiRv54hqXjQQhm89HlRJwll4ois9gGKFd1XwUvP2pEnkvgP/SVtFT
         rhlppb0mQ12q3Yvux6OsqzULYLkO/PcruNtpQo/t5SOAVW/1Gej7Txx6ULl/iDC4YNlq
         q+XTaAP0JK6TCnNy5s9JP0Z2YHU+v46g3yO08s4BmvevgR1gXhb9Y5JnXqq8MhEIqxcO
         ub8w==
X-Gm-Message-State: AOJu0YwddkuN9FUlVjrVM4bwLek9ezlKCNyPL1WNJzhAfSko6kyQnb1H
        sXZfP9oMA02Yk2d84WQAAgg9AjbJq45LIoDLPTh4E7JO5ZjIsGGt
X-Google-Smtp-Source: AGHT+IER/otpoIuFfvsxcXy2FWF3fIcGBep2r1GRdZPNRa7Qaor+BQNz/w5w/F7cynhoOnmkAQRZVQ2aDU8OmizXJPI=
X-Received: by 2002:a05:6870:1607:b0:1e1:371:c3da with SMTP id
 b7-20020a056870160700b001e10371c3damr28720679oae.20.1699136673317; Sat, 04
 Nov 2023 15:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231103195310.948327-1-andriy.shevchenko@linux.intel.com> <20231103195310.948327-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231103195310.948327-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Nov 2023 23:24:22 +0100
Message-ID: <CACRpkdZRAj6ZYtk8omN_UW7g=RP+tUXLcVp66Li5Wq4vLBqiFw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] leds: trigger: gpio: Use sysfs_emit() to instead
 of s*printf()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Nov 3, 2023 at 8:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

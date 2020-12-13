Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F412D8C5F
	for <lists+linux-leds@lfdr.de>; Sun, 13 Dec 2020 09:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404418AbgLMIUJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Dec 2020 03:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404178AbgLMIUJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Dec 2020 03:20:09 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB63C0613CF;
        Sun, 13 Dec 2020 00:19:28 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id m25so22343552lfc.11;
        Sun, 13 Dec 2020 00:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gGpGJE117uuu0mrJjD3uk83rQznDbmUGhxCc2a6Owt0=;
        b=VafUivgY/GTbQUK7U+t47larm9y1WZVXfFLko+4/fILf0w9h1+1YXiOrObZxalMVXv
         74DOYg6i7o+jDeCMR6MmeDgA6B3ITUEtILbcKgTTRFsRpoYXPJG8ZltVQoC0d83UW85+
         2ObAsi0WHefdn0gWwxnAPS8gUJ4LYL3B0ao9ikkrjvCzb7ucD8DOlnxXHehG05g8rTcL
         DSMZUJQ+ZNkmIyklyaCG/zQipNGiNurpo4yerBfjYqk74YlOTvIW1wc46sZH36bAihJG
         Ne7beno5RVLSMdZYUbj6FN1hAqM7Nlm3id88ysyNnQwHXKjWu14bKtb7oywSUf7hon0s
         Kqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gGpGJE117uuu0mrJjD3uk83rQznDbmUGhxCc2a6Owt0=;
        b=k8MVtUca6CVwLMUaZhYxKsATKhB4ggSfdh+LOyprkDLT+n+5jkABUCdDWigT/Cu3r6
         TPwnB26aq54SDtzaieaw3QAF8IOHCEKbvx2EPeVY03wRboEKjCRkmkZsaau64TnrTTwO
         70nskNuOtPoeBiSAY5iSyXGnm/PN89r/Q4/gL8L536rrIAtX2H2QrMmOYUrmhp8KCyTt
         f9OZxP4f4FE1rBglvJr7c8J/EKzNepAd9efZVgWTMVvrACzDroEqrQpgh8SwClKF8Sxo
         hlWf0735zZUlnpTvoa249HRvGAQMJe1hkE+1WuXs1k+VzDYTitsv1K78aQxaRen/6Dw8
         7x+A==
X-Gm-Message-State: AOAM530OYQVybBW8Bn+HU+oAnvk+8y8fa4SSPUaRQ5aYsxoF+ReDE881
        Thyjwcn3VsKx2Yuo8aohkGj7YnzrBauuNLBn48Q=
X-Google-Smtp-Source: ABdhPJzB1WJVmw6oioR+YnA3WOh0S77J//JsdipVKPwKjVz/MpcQscWUBzPJZk2Xs7h70pReIf9bMvQmtdxPEsLvjY4=
X-Received: by 2002:a2e:3312:: with SMTP id d18mr7486964ljc.284.1607847562396;
 Sun, 13 Dec 2020 00:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20201212195548.231494-1-dwaipayanray1@gmail.com> <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
In-Reply-To: <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
From:   Dwaipayan Ray <dwaipayanray1@gmail.com>
Date:   Sun, 13 Dec 2020 13:48:58 +0530
Message-ID: <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
Subject: Re: [PATCH] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-leds@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Dec 13, 2020 at 1:31 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sat, Dec 12, 2020 at 8:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Instead of open coding DEVICE_ATTR() defines, use the
> > DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
> > macros intead.
>
> typo: s/intead/instead/
>
> No need to use the word "instead" twice in one sentence, though, we got it :)
>
> >
> > This required a few functions to be renamed, but the functionality
> > itself is unchanged.
> >
> > Note that this is compile tested only.
> >
>
> This note does not go in the commit message. In the future, this will
> be simply not true anymore, but this below the "---" (see HERE! as
> marker).
>
> For testing, you can generate the objdump of the binary before and
> after and compare if that is as expected.
>
> Other than that, the change itself looks good to me, so:
>
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Thanks, Dwaipayan, for fixing this up.
>
> Will you also add a checkpatch rule to identify other DEVICE_ATTR(...)
> that can be adjusted to the refined macros, so that checkpatch informs
> other submitters as well?
>

I think a checkpatch rule for this already exists. But it cannot automatically
rename the function names. That might be the only drawback we got.
Probably clang-format could fix these automatically.

> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Cc: linux-leds@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-kernel-mentees@lists.linuxfoundation.org
>
> As far as I know, the maintainers will add the Cc lines---if they like
> those---with script support.
>

I thought I might ease the work of maintainers to add those lines :(
But nevertheless I will remove them.

> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
>
> HERE!
>

Thanks Lukas.
I will be sending in a v2 if the led maintainers have no problem with
this patch.

Thank you,
Dwaipayan.

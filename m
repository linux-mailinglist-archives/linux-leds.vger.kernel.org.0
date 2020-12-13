Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463A42D9044
	for <lists+linux-leds@lfdr.de>; Sun, 13 Dec 2020 20:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgLMTri (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Dec 2020 14:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgLMTrh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Dec 2020 14:47:37 -0500
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C01C0613CF;
        Sun, 13 Dec 2020 11:46:57 -0800 (PST)
Received: by mail-yb1-xb43.google.com with SMTP id o144so13014877ybc.0;
        Sun, 13 Dec 2020 11:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W1lkJR6Tf0DSnFojsG7MMX8zHLQgDTQjXzhBTEJ/2jw=;
        b=PG7d8+k0vVH/CZnexGwEEFsg8otWhpWCqHVRmhwgJLNIp1T8mhMgEzeSStTtnbXq4Z
         SJBHXkfB2VA/8WHiN5bMuGY8/Jwnkqgnq3minO/aG+sfx3KY1K8dL//FE5UiNcmObpAB
         NIAtJlTu1Ai0gJuCLbiO6ottS7Ak+cYWQms/+qOqvWRY40qRuC+66sEMFI3tW3dpaXRd
         544K2rKZVYywsThZYPkY1EvFawo7ljVDBR6eF40WC/hmath2DSunXP9jRMD3ZsxEE928
         DgXtpH9a7k6k3IbT7SYJSR0UIFJ1rrenEmv/bnuTBg0QY/y3Uv+Dt8SNmpeJWyinvOv2
         HrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1lkJR6Tf0DSnFojsG7MMX8zHLQgDTQjXzhBTEJ/2jw=;
        b=GuUW+K1CljGubUwMP/tlYSEdtt36owhXIh36sKzY15RAg77xqIikVdfCSCb7v5iPBC
         ssTiMH+qRTzCURuI2nRq2fow3QBMAReifif0ePy89/Z8PjKJ0JSnPtT/6Zockh64Vifm
         NPHEITEYQT4/k5CePAtgNxop9heaVco4ItrHza77r1mPyoOwd4GYwWIgkbBx0x8iUvel
         6Wp7pccW5mZ8Gvgdz4Sy/01lbu6VAFdVd+tbj10r3xJ/egpapsSeEPVUMiW+VZq3JjpY
         1UBJmudaPmq6uAcEna5te57ywut2auCWa/FHUG7I3O5aYAOPGOcwWU+RAvelBMrA75Mk
         t0iw==
X-Gm-Message-State: AOAM532NYyrF34oh6K4LDYYtqiMJl+0t5K/5LPt/VazQ898FHisgTDiK
        N89YLB6/lfBbrmvZg62zDh793ZOpBYyP7GD++4kt+OoT
X-Google-Smtp-Source: ABdhPJxhpX6GnebHkY3TuhpxGk7g9frp5gRKb3YlxLsRdnIolUVmruMsUd3PNtzc+vvVWRINN1Ad1krS5cke2/HYjEI=
X-Received: by 2002:a25:50a:: with SMTP id 10mr8558198ybf.115.1607888816911;
 Sun, 13 Dec 2020 11:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
 <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
 <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com> <3ce8fa0c0d7a2c38b532bd4944f4158cfa0db072.camel@perches.com>
In-Reply-To: <3ce8fa0c0d7a2c38b532bd4944f4158cfa0db072.camel@perches.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 13 Dec 2020 20:46:46 +0100
Message-ID: <CANiq72kOE3Y0Jji=igG_vqu0MoZyGeJJSfNWwj3ZA4oSikG9eQ@mail.gmail.com>
Subject: Re: [PATCH] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
To:     Joe Perches <joe@perches.com>
Cc:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-leds@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Dec 13, 2020 at 7:21 PM Joe Perches <joe@perches.com> wrote:
>
> clang-format is not a tool to rewrite code only neaten its layout.
>
> coccinelle _might_ be able to do this for limited cases where the
> show function is in the same compilation unit/file, but even then
> it would not be a trivial script.

+1 The most robust approach, but the one that is most involved, would
be a clang-tidy check.

Cheers,
Miguel

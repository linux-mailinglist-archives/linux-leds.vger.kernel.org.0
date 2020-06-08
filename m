Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069381F1E96
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 19:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730464AbgFHRvM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 13:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:41816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbgFHRvK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 8 Jun 2020 13:51:10 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F0CE20775;
        Mon,  8 Jun 2020 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591638670;
        bh=D3wXppTORQC+JC0dFtrdJuZe1H4pJQ8bCoTFA0U9esw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s2AR2Yrg/tJxynRmYNFBC6UXPd8+EqR744bap35dWc+yAqhWlbSSNSqCkGx+KvwzN
         Ae8CjtbPpIoe3NwZ6bCYWQ8n5Q8pblA8VuRdz23DNBuskDG1e7DZHNAA2tho0c9Pbt
         XHHIZV4VahsfNehm/kKb4FtyB9oV+rZWgzUW9pLo=
Received: by mail-ot1-f52.google.com with SMTP id 69so14373441otv.2;
        Mon, 08 Jun 2020 10:51:10 -0700 (PDT)
X-Gm-Message-State: AOAM532UNvwMZT22kcRKQeXo7GqU6iIhdMKoI2Tzx/Hp1l56NykAWT08
        OekTuDRAQIQVjIi2UhqKbuz0gM/Io6uqul/puA==
X-Google-Smtp-Source: ABdhPJxe0EkadgRIWouviW9EZkoWQwgnCT0eAlnT5eiamTIRGqJZGjSFGRHmq77px3PI9IxPj0Gq8fbQMt6pPNoMHBY=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr18915553ots.192.1591638669404;
 Mon, 08 Jun 2020 10:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200604120504.32425-1-dmurphy@ti.com> <20200604120504.32425-7-dmurphy@ti.com>
 <20200604230456.GA6520@bogus> <f8d648cc-9ff6-33a7-6da9-300a6b5b7d1c@ti.com>
In-Reply-To: <f8d648cc-9ff6-33a7-6da9-300a6b5b7d1c@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 8 Jun 2020 11:50:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK6Wy1=T6vLn9dNd5tiK-_MdGcWEJWeJT8KCqqRXQ5eVw@mail.gmail.com>
Message-ID: <CAL_JsqK6Wy1=T6vLn9dNd5tiK-_MdGcWEJWeJT8KCqqRXQ5eVw@mail.gmail.com>
Subject: Re: [PATCH v26 06/15] dt-bindings: leds: Convert leds-lp55xx to yaml
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 4, 2020 at 6:08 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> Rob
>
> On 6/4/20 6:04 PM, Rob Herring wrote:
> > On Thu, Jun 04, 2020 at 07:04:55AM -0500, Dan Murphy wrote:
> >> Convert the leds-lp55xx.txt to yaml binding.
>
> I will fix all your comments.
>
> But why does your BOT have checkpatch warnings?
>
> https://gitlab.com/robherring/linux-dt-review/-/jobs/581282098/artifacts/file/checkpatch-1303471.log
>
> Is this because checkpatch thinks the .txt file is invalid?

Because there's a bug in checkpatch.pl on handling these conversion patches.

checkpatch.pl runs mainly because it was easy for me to setup and get
integrated into the patchwork checks.

Rob

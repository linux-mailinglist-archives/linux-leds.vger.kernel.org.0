Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344AF31FA7A
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 15:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhBSOTg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 09:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhBSOTf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 09:19:35 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C323C061574;
        Fri, 19 Feb 2021 06:18:55 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id z7so3433942plk.7;
        Fri, 19 Feb 2021 06:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4cuhH3PJCtWaiigMuxwQmypqZPutCoas2JTMVgIW20Q=;
        b=J9aZx/fE7BvKWvd6MJEI8PWiGRyrBIr49rtRDUvn2zBE7WPS9wjIqmnG6H4fvTXGVY
         P/HMvpV+tUbucmjTAcG+L1OW4NVr7cybB4s1TGcN2wqOXXB5FGuFYraTwwzbzewOWrXN
         ds23bgXvDs8FVYLOMJYjzY5PXDYEb4aDZh8oLsRynEmpMAas7x8r2jMb9cF9oH4Lx92W
         rkt5FmbKjtXa+JbY107wjj4xeV1K4SdlsEArAMxWUsRUWLLW6nphMRHbW6czI6bA+Uif
         8OfVz+ixetEzLler0ATLrYK0zdvMf0trHpVg6QEN1pYv5pGPZkgGmTpRxv0Esffg2S6R
         lKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4cuhH3PJCtWaiigMuxwQmypqZPutCoas2JTMVgIW20Q=;
        b=hiTEN4icm1J22yj9Pn5Vo1oFr/auXgUAPJvXlnOlLWYf5tmXiQyTMqRCafmQKVmRNT
         A2Lx2qbjw6s5EdblA4sDa1AG38ICwHEqp17stHkz0ULHcllkzPQ3xxt89EO2vD9vYkjK
         7NGnPih5jucjqqrZPNHzcWYgT8rqBNwL9BYbbb/ehsHe4EnGU3Sx55qbUZO0mjT8wPGK
         470XJ86eQyCt8HiZohnCEya7lMe10EIpEqvmn8oPWIFGmIqjxkQ57yp55gdAPSE6UU6t
         7Camp3WCCFWLqde0IaskQ0wPhjzHoT34O+HpyCnM4RfvqehG2ERDWk1N9MDtPJgJfYpf
         vyLw==
X-Gm-Message-State: AOAM532i4ukI/YujO9RNCmt9Dpjc0kFkpIqvTHViTc3ns2SQkZNzsRtb
        z6hAgHJspOVm2GFVujToanNR6z62L+254xX+CPY=
X-Google-Smtp-Source: ABdhPJxJI6d/fGEQgzM8KlPqkY4AZo5mTJfePlgY8tq6bkIId46U7GX65hAaQcHW1F39nh7Jn4M0JOn52i5waxd1ijs=
X-Received: by 2002:a17:902:70c7:b029:e3:71cf:33d2 with SMTP id
 l7-20020a17090270c7b02900e371cf33d2mr9407653plt.21.1613744334725; Fri, 19 Feb
 2021 06:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz> <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd> <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210219111659.GI19207@duo.ucw.cz>
In-Reply-To: <20210219111659.GI19207@duo.ucw.cz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Feb 2021 16:18:38 +0200
Message-ID: <CAHp75VeE5vpfAXeppOkfAmQS=dwexW8SuWj3ovFmeCQ9kuQ5sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 19, 2021 at 1:19 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > > > ? Does not make sense and changelog does not help.
> > > >
> > > > This is an unused variable which is in the driver
> > > > (same as the regulator). Should I provide a patch on its own for that
> > > > or just describe in the changelog?
> > >
> > > Lets do separate patch here. DT changes will need Ack from Rob, this
> > > can go in directly.
> >
> > Okay, I will submit a separate patch
> >
> > > Can you or Dan submit patch getting the regulator support to work? If
> > > not, I guess we should remove the regulator support after all.
> >
> > To be true I am fairly new to the kernel and have no idea
> > how to test this. So no, I don't want provide a patch (except
> > for removing), sorry.
>
> No problem. It seems Andy submitted series for this.

Ah, now I understand what you, Sven, meant.
I didn't touch regulator code, so it left the same, but making it work
probably needs just enabling during ->probe().

-- 
With Best Regards,
Andy Shevchenko

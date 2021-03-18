Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6D534024B
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 10:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCRJom (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Mar 2021 05:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhCRJom (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 18 Mar 2021 05:44:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB9F64F30;
        Thu, 18 Mar 2021 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616060681;
        bh=KvNoRGQfof5yJMFfYuVzb7mkV2WnlXWYn36iS3emWug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BQ14ZDad128Om3qgxda6D3RbtY1P254WTjF+k/R1vAJkBCG3v03Wlq85uNWEPpP+a
         8+465l857triQ20gGjQNjRrGWXHlmwUXVsX6d8wz35mrL/NA4d0ARVw1PeI8f0fJCG
         XNcYqyxJfzR/rJ9Q9sjhIzv90WTtQ8oYDMdjrRuZRXoSMferKCHfckjw4DyEZkqE78
         0wYLexsOESURfXRzXCZ5v5VNto7vsRaw2vCtgbAfRjYW51H6nTqjLWYl7/shSvWHJf
         Z7tZ3f4u7SZkxLkKdgHLT37V7sX3MZHq/VETBmLKU3D5ZIDmn1AidzZde8M06bNxJc
         KuaTSgOSjfpUw==
Received: by mail-ot1-f53.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso4615166otq.3;
        Thu, 18 Mar 2021 02:44:41 -0700 (PDT)
X-Gm-Message-State: AOAM532EeHLV9FbKiTfx9cPqlK+wWLYaoMBVy7qsn45kjVzXEjyY3dDQ
        8hxksvRZJIphT+/tSHIDNy0HQD7AAMPx4MlJWLs=
X-Google-Smtp-Source: ABdhPJxUwCLzi9BL+QYjzpwdhKnlbQMsqmM6ed6kyd9gvSXzRPIrnq9aOv0eNNZWjZOJZoa+FxzW0ppxm5qH/fKPR+0=
X-Received: by 2002:a9d:6341:: with SMTP id y1mr6746228otk.210.1616060680700;
 Thu, 18 Mar 2021 02:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <42a0c810-4b6f-1853-60c9-e36a9dc6100a@infradead.org> <MN2PR19MB3693144BDCCAEF6F7FAB6BC0B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
In-Reply-To: <MN2PR19MB3693144BDCCAEF6F7FAB6BC0B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 18 Mar 2021 10:44:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3PjdgVDbH-cK7DygPYwZ85APQLCNHSOBtsCvybbmJ6fg@mail.gmail.com>
Message-ID: <CAK8P3a3PjdgVDbH-cK7DygPYwZ85APQLCNHSOBtsCvybbmJ6fg@mail.gmail.com>
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, Pavel Machek <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Mar 18, 2021 at 10:24 AM Rahul Tanwar <rtanwar@maxlinear.com> wrote:
>
> Hi Randy,
>
> On 18/3/2021 11:02 am, Randy Dunlap wrote:
> > This email was sent from outside of MaxLinear.
> >
> >
> > Hi,
> >
> > For the leds/blink/Kconfig file at least, something has
> > changed all of the tabs to spaces.
> >
> > Keywords in Kconfig files should be indented with one tab,
> > while help text should be indented with one tab + 2 spaces.
> >
>
>
> Hmm, facing some IT issues with git send-email so i had to send it by
> other means. I will fix it in V1 by ensuring that i send using git.

FYI, the usual convention is that 'v1' is the implied version when you
send a patch series for the first time. If you send an updated version,
you start counting at 'v2'.

       Arnd

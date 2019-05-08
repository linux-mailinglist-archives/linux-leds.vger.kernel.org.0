Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 174BA17986
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 14:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfEHMh5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 08:37:57 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37116 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfEHMh4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 08:37:56 -0400
Received: by mail-io1-f65.google.com with SMTP id u2so13491432ioc.4
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0VSLwYO4ajiCw1Y1sGYTbNpEZFeZdK3LyxgFKcQp7zw=;
        b=Fl4PTXyWhYB3k7R9TiGqUO3gRiqHndIFQx5R/XH4YBppV2hu7K24dX31qw3e3yFsXy
         gu1lb1qkaH7CVg8ns8F4x2VFATP4t2ksvNFcuwqG0E5sVgmMMQQAKY+vAFk2f4SKwVhb
         SuFD9vUX3LBGQvUXQInG8fGA/r+xOsbS4JGpWt9KVFd32gCUvEGaquV9QGWcw8bJqAJC
         5CiUkBfNndHNPa5EqKWQHJS/wfUDJGgD837bHNQf7WGoZlXiRm0Kp2LM9H4V+m8uyob5
         aGRtOS0J9+pmsnWOi9Ec1EznWi34ylxBaPH2R8jN5aPjPO3tu3Kk05EO7itnAU5v8KQu
         s+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0VSLwYO4ajiCw1Y1sGYTbNpEZFeZdK3LyxgFKcQp7zw=;
        b=WxXSCeIc9Jdkkrz6jCE11MvjHpKCtM5gqV3Lo9HXzCCBRf4gxMEQO7z5HE604R8r5x
         gAhTAGqgyeClE//gvuF4UfUB+jTlKZu9MV71ZvIdLlTfJwx8MnWzKjVGGWsQItLbiSBx
         /yhkLRuZVWDmv+KZvNhxx7LsZlVDDnLpBqkBFkPmz2wpHH5hR9+6y7xD+TV7PXIhplwn
         5sFM/iAuF5JKbHvIfQZcRaHCevcT7hccbzEAVUqykpiDjW6/V2LUJPM1RlZUNVSn6pnW
         n4TfngQL0glYAgIQKSFsEeinY9OmoMwgH68N2lLGtvz53aXWkqoFfp7K3pXbD95gTbRV
         SnNg==
X-Gm-Message-State: APjAAAWgEnby1oG3fTZRWItGP2cqP1LF008k2WP4UkqdicqXHr/8Dwm1
        bnJfBSd1s3l0lNe0wBwVNBIWFoZ+OHY72SkSik8EVQ==
X-Google-Smtp-Source: APXvYqwqgwN1WWnNZT1cKjwLh1pp35JJJ6nWlhlapspRTelB16v8EwXOj1fRgTsrnQ96pGz0gUiC6BN8mPrfk7czTNo=
X-Received: by 2002:a6b:6d06:: with SMTP id a6mr9810801iod.11.1557319075568;
 Wed, 08 May 2019 05:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f70a0e0571ad8ffb@google.com> <0000000000007b03eb058653caea@google.com>
 <20190412130112.GA8384@amd> <alpine.DEB.2.20.1904121520350.22857@hadrien>
In-Reply-To: <alpine.DEB.2.20.1904121520350.22857@hadrien>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 8 May 2019 14:37:44 +0200
Message-ID: <CACT4Y+bcdEg_M5RNVKQvYPVLs1skvatGW-yTht7yDexR=Hjnyw@mail.gmail.com>
Subject: Re: WARNING in untrack_pfn
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     Pavel Machek <pavel@ucw.cz>,
        syzbot <syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Haozhong Zhang <haozhong.zhang@intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, jacek.anaszewski@gmail.com,
        LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        rpurdie@rpsys.net,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Julia Lawall
Date: Fri, Apr 12, 2019 at 3:21 PM

> On Fri, 12 Apr 2019, Pavel Machek wrote:
>
> > On Fri 2019-04-12 04:42:01, syzbot wrote:
> > > syzbot has bisected this bug to:
> > >
> > > commit c68729119f4d2993bec3c9cb999ad76de5aeddba
> > > Author: Julia Lawall <Julia.Lawall@lip6.fr>
> > > Date:   Sat Jul 15 09:58:19 2017 +0000
> > >
> > >     leds: tlc591xx: add missing of_node_put
> > >
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cda0f3200000
> > > start commit:   23203e3f Merge branch 'akpm' (patches from Andrew)
> > > git tree:       upstream
> > > final crash:    https://syzkaller.appspot.com/x/report.txt?x=11cda0f3200000
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=16cda0f3200000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=861a3573f4e78ba1
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=e1a4f80c370d2381e49f
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17836d15400000
> > >
> > > Reported-by: syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com
> > > Fixes: c68729119f4d ("leds: tlc591xx: add missing of_node_put")
> > >
> > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> >
> > Can you revert c68729119f4d2993bec3c9cb999ad76de5aeddba on master and
> > see  if it fixes the problem? Because this is hard to believe...
>
> Likewise, it seems hard to believe that the change is a problem.  But
> could the problem be elsewhere and triggered by this code?

Looking at the bisection log, this looks like a hard to reproduce,
flaky crash. Most likely the crash did not fire on one of the commits
and that diverted bisection in the wrong direction.

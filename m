Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D06114FEF5
	for <lists+linux-leds@lfdr.de>; Sun,  2 Feb 2020 20:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgBBTng (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 Feb 2020 14:43:36 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41719 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgBBTne (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 Feb 2020 14:43:34 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so12373206ljc.8
        for <linux-leds@vger.kernel.org>; Sun, 02 Feb 2020 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTa6/XyD9+1rf3drvOvMXmn8CbIo2ZjdpFVcqn/gc9g=;
        b=EfUtqz117cqXcYbEgkMSPNj6oPjibOhSAJkUPDpEi877070epBxNt/Rb08Q7q1HKhq
         wfcBqujnysYOIADcSZrkRgnXEW5dtEJO+DqpYt0VtD4BlT2ssubWQmsZI6R12aGULY9t
         iM3TjT7CNxC2UpI9+wf30k7vxpuRY6L4jbnSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTa6/XyD9+1rf3drvOvMXmn8CbIo2ZjdpFVcqn/gc9g=;
        b=UUpGrISIBQmHCcoZbND3RP32H3cVipqz4tG2ZUp4Ctrtrh5gEUIzzCL+VyUqOs1Z6t
         r0RNl62kCS2p60gmj5pyW0fD1GGygiAkE1nzC5I1Jp23o4DLUWn56aMbyDBwVk7a5Qa+
         xwCMJed1O6aF5c/Pq/8h7yfh+ehnFNfzzkeXuZyVT4VpC/M4iWvZy5biBGwm6nqmI3GH
         Spe+5OX0WOLXnkT/0j+WNcWQVaMiDOs7D448YxnZyYRqZsBAhjWTemCL+FPA0/o/yuVg
         mjXGUeWcTA+4cba8ZJfL9I3wld9Q30h2ASbFG8LYS7/pL9P6fp7hlcjwLsWvh1UNLc1N
         dEvw==
X-Gm-Message-State: APjAAAWrRtidEAnB3QxOQ+0sCB43w3laZSh/0Lns3Z+Fc+BHvJFHZrFV
        xZL4rCRYPyYCkWfZcHg6Yg63d7c9Q6A=
X-Google-Smtp-Source: APXvYqz6J9mFXqsvome6Z7LZJmPG6CbEIWJl3fW71Bd5yaeCwtwxEmDhnJ7DRhoteTeO8DpnVRe9GA==
X-Received: by 2002:a2e:880a:: with SMTP id x10mr12190123ljh.211.1580672612019;
        Sun, 02 Feb 2020 11:43:32 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id t10sm8484433lji.61.2020.02.02.11.43.31
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2020 11:43:31 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id m30so8194554lfp.8
        for <linux-leds@vger.kernel.org>; Sun, 02 Feb 2020 11:43:31 -0800 (PST)
X-Received: by 2002:a19:c82:: with SMTP id 124mr10161529lfm.152.1580672610699;
 Sun, 02 Feb 2020 11:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20200202190943.GA4506@duo.ucw.cz>
In-Reply-To: <20200202190943.GA4506@duo.ucw.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Feb 2020 11:43:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgsTkPZBCkmtx5o+X3penAzz_DeynChQO906NmqXd9r3Q@mail.gmail.com>
Message-ID: <CAHk-=wgsTkPZBCkmtx5o+X3penAzz_DeynChQO906NmqXd9r3Q@mail.gmail.com>
Subject: Re: [GIT PULL] LEDs changes for v5.6-rc1
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Feb 2, 2020 at 11:09 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> LED updates for 5.6-rc1.
>
> Some of these changes are bugfixes already merged in v5.5, but I'd
> have to rebase the for-next branch, and git merge handles that ok, so
> I did not do that.

That's fine.

But I'd still have really wanted a short description of what the changes are..

                Linus

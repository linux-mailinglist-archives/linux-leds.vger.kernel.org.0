Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F143F309EB9
	for <lists+linux-leds@lfdr.de>; Sun, 31 Jan 2021 21:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhAaULu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 31 Jan 2021 15:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhAaTqL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 31 Jan 2021 14:46:11 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEEEC0611C2
        for <linux-leds@vger.kernel.org>; Sun, 31 Jan 2021 11:37:39 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id t8so16909986ljk.10
        for <linux-leds@vger.kernel.org>; Sun, 31 Jan 2021 11:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=my2oXzkPo/tQWCpnLGRbv0pAizeXOsJ9cPzchjq5RxY=;
        b=BbxDxf0zJFDqSzGNZANAVcXfNNc6fQsN9oQ7j6Qy2FKIMRbEc6Ke8yskPVCRoVcKXf
         jxBI72igoEB409ACYiVp8qJoYTAcAM6WsnMT2fMY3nnp82sCxarGfyHvk+tm+F2Zr3vJ
         pkmHBI36v2nlztLVixQ4B2hk+LFQTTC3WpN7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=my2oXzkPo/tQWCpnLGRbv0pAizeXOsJ9cPzchjq5RxY=;
        b=gNiKjnLFYvwtnh/Dpj1xpymYberBEwFgS4df/B/dE0eyMk87N1hlssKGqnFiMM6VKg
         SWxfYj3vv7j7HoKiI9y846+K4iDWX4Vo2UKm/SEB/2Wbylsv+WG5P3QfmPAbtbaQf9Iv
         ruMRPvQ74WjqHAIoJ5jA7JeOvdK89KA6dmtpBgcIog6rzjvW+3pVjYUVJ6rKNXSzH4Zp
         MrpiQAz5XoUTU8xvfY14KnNZ8GrGT2wpYeYW87FARKYvgb/mLDfqShUJJa/0yX1lIwmB
         SI+8Tg7u0xOefsd5dQ/39KvbiZOVkn2hjazD64xaVoW593Tg5SREQyCWG7PDgDQJHvh4
         IW1g==
X-Gm-Message-State: AOAM530/TB5yzc0giLxJphj+lM83A9D9lshA9dy2vj50af5QU9dx/7tZ
        n470QKNggB5ERs/tjnfLq5PT6DNALibIow==
X-Google-Smtp-Source: ABdhPJyRNxjE6+KJbC+ykWuly9niakPMKx5bYVxl6udqBUEZGqIb3ot/jqRw3uA2efLsZzq4YaB97Q==
X-Received: by 2002:a2e:7819:: with SMTP id t25mr7993336ljc.300.1612121858093;
        Sun, 31 Jan 2021 11:37:38 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id r21sm3552932ljk.1.2021.01.31.11.37.37
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 11:37:37 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id m22so9519906ljj.4
        for <linux-leds@vger.kernel.org>; Sun, 31 Jan 2021 11:37:37 -0800 (PST)
X-Received: by 2002:a2e:8116:: with SMTP id d22mr7942108ljg.48.1612121856862;
 Sun, 31 Jan 2021 11:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20210131094255.GA31740@duo.ucw.cz> <161212172023.26762.11083214605908540466.pr-tracker-bot@kernel.org>
In-Reply-To: <161212172023.26762.11083214605908540466.pr-tracker-bot@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 31 Jan 2021 11:37:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjjTQCoVztHjyMeKiM_OLJcgaBLc5seGcJAnugcLvKBew@mail.gmail.com>
Message-ID: <CAHk-=wjjTQCoVztHjyMeKiM_OLJcgaBLc5seGcJAnugcLvKBew@mail.gmail.com>
Subject: Re: [GIT PULL] LEDs chagnes for v5.11-rc
To:     pr-tracker-bot@kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Jan 31, 2021 at 11:35 AM <pr-tracker-bot@kernel.org> wrote:
>
> The pull request you sent on Sun, 31 Jan 2021 10:42:55 +0100:
>
> > git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-rc-5.11
>
> has been merged into torvalds/linux.git:

Oh, look, one out of three (so far) did get a timely automated
pr-tracker-bot reply.

The automation isn't dead, it's just not feeling well.

               Linus

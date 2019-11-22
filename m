Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3CBF107353
	for <lists+linux-leds@lfdr.de>; Fri, 22 Nov 2019 14:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfKVNgp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Nov 2019 08:36:45 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46590 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVNgp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Nov 2019 08:36:45 -0500
Received: by mail-pg1-f195.google.com with SMTP id r18so3342977pgu.13;
        Fri, 22 Nov 2019 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FpkrJM5+SpGK1wkNiet/Xfi9GNr3AK4bz0xCehuUP1Y=;
        b=CTPl9oZvbl5E2DCfsSUTaQ44PGN7XOrQVymMGD0aLujEYbEifZAlLZCBqX64/KTs0Q
         KpLHAB83C6qknrqUPPXoc+cJmWidp0Pd1jgjSAPYFdchTeAYaLTxdjtO47z5gEU+xhql
         7Sralgfq3pcYzB1hNhrT1mcpVbYufFK1eeV64diiMrBRr7xYGKgGjJhN+dbL/JbHhOvw
         qbRqMUlVK1TOPzJbA8baA6TwsPSU80Mm4fMI0NX6vggO8baTxWk8wlCSWSL/d+1aqPUy
         SFlQ0FrNh5fLIF+UHja5JfeKkwQb4TYLpqJDO53RL3YhTpJDR27SCFXkAd50oXQj95ww
         9YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FpkrJM5+SpGK1wkNiet/Xfi9GNr3AK4bz0xCehuUP1Y=;
        b=bnhrMeOa5oYCVd0Y6tAe6ld9yCWh8ZoSYguGlj2Xc/Y5taSyLy3aDq4dEuHZUpN+zd
         yRNymsJrZTO+MMgPdHK5Kl+JBayaw1gwDYQukT2t22ZRttTArCaQbx3VMK7LM603YrZ0
         zmg8XzTkLQtcWRAvg903kdAJ505mFjjy1kEYLOTvTtEFHrPnlzNeMqV0u3NKkKlOxObX
         9NgqScsG0p6sDxrg3bKwqzz1Ny4Nzr/0FT0X+QxDk2IY4v6NdvANmLHSmjVdbAVhOSyE
         V67EGAvYPXUJH4AXcdCjGmnaQ4YtJPbJDESKNkV0NJtJ+xlmupSl8rDhpt8X9vBR5JLl
         ze1Q==
X-Gm-Message-State: APjAAAWEa0uPJc+1csf5EJ9hHD3dNsqTw6vw5ng3MBg1LJuJonsE83Jx
        /N23fHtrilZEGdnvNagCEyFiVNX2GOVFEQ6PHsrUxQ==
X-Google-Smtp-Source: APXvYqyVcu1tPi/Ky7Ae9yI+M9YlOIJ4Zw2tVItNIoR2Vf3cDcywPStXTCZDmhQ9lm6lUiXGAXrCsB4N4O4+anzTWBA=
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr17710552pfb.167.1574429804062;
 Fri, 22 Nov 2019 05:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20191121142726.22856-1-TheSven73@gmail.com> <4b64bc1d-681d-8916-7247-a9536afc00c6@gmail.com>
In-Reply-To: <4b64bc1d-681d-8916-7247-a9536afc00c6@gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Fri, 22 Nov 2019 08:36:32 -0500
Message-ID: <CAGngYiXtHC7Ez2c1wXSx13jTcaq+vW69FpNokZYvk7vqt6FmpA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] tps6105x add devicetree and leds support
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Nov 21, 2019 at 1:20 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> For both patches:
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thank you Jacek. To get accepted in a maintainer tree, does this
patch need more acks/reviews?
Should I continue to include it in new patch set versions if it doesn't
change?

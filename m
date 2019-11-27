Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12BB10B002
	for <lists+linux-leds@lfdr.de>; Wed, 27 Nov 2019 14:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfK0NP6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Nov 2019 08:15:58 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42187 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0NP6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Nov 2019 08:15:58 -0500
Received: by mail-oi1-f193.google.com with SMTP id o12so19996370oic.9;
        Wed, 27 Nov 2019 05:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CkueVqYBVME4T6LCtYwHv1Eee1VzP9kC3ml8CBVr5I=;
        b=W2fTFwY2oMJ1Pes7MKv0yHAiftsFHjSXYvZWG49vfD1BoEEwfYoNVMlc7Agv6f46iN
         v08NnMe9nRV6QR5eFcvtjMQnJqNn1uCHnNBvhfmnb9kSIj+QCMiV0FH+5IQng7TGJhPQ
         W53GMkuug3/ZJIIb1NQjuAciwaAHgdTOn4fa5CFaII9KcdFnW0rs4ZpYrblcl91hrJzw
         jdCPAWS6POFUPm5MbqlVXq39nnal3JCMF1f4wne/iTNCdC5vrqMFSssO7CdScIRejg/8
         BTZGy5MjCSGOHnXWGz2v2St3krrrJhhsj2hbOhQ7thRAdQzrQ4l6hKKKRt0lhhPP7CVc
         DOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CkueVqYBVME4T6LCtYwHv1Eee1VzP9kC3ml8CBVr5I=;
        b=JbH2tHhCYdzBJoB9uyvkaCfW+VR8LFr1QmOxeTyZe6J+0/VnFvrPjVSXVrBDffkAS/
         pWHQmxzaGfExz7rwQ/0O6MN5Gqnv4oyQE6IE2D4t9w9SqKz+rgvgGzpHKHTmEUjn0n51
         URViTWPcBfL0aasGLXL7sjC8WN9cLcMrdUZ+yNxx76hiXgu4RwWIp899hQ2U9P2ojiGa
         saVEtZgJOPEdarLFMdjRU03SjUxKlU4qqUTyPvZxifK0EeTXQARVhTtQPaPwegMby+X9
         GY0ns6WMCSy1CnY7sSvK6yv5aN+Bp1iWDjB6Q/yUZpH9guuXbTv09JenGac2NFGqZmR+
         43Yw==
X-Gm-Message-State: APjAAAUe2/a2pOixt7vBAHJVUjLuH+Kpt31e8zo5SVvzDVG41ii2J+VR
        Oi8AC/nNV696WAS0V6jJbRM+gBw1yw2UdaQUAJw=
X-Google-Smtp-Source: APXvYqxF1YpJNZWQuhLaSnKq95shVazEciEynAl3XJWt5hhnLgcF5FpqLpdnh48Ipc78REvTah8XXP9RsYyAozMphLg=
X-Received: by 2002:aca:c5ca:: with SMTP id v193mr4176878oif.77.1574860555146;
 Wed, 27 Nov 2019 05:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20191121142726.22856-1-TheSven73@gmail.com> <4b64bc1d-681d-8916-7247-a9536afc00c6@gmail.com>
In-Reply-To: <4b64bc1d-681d-8916-7247-a9536afc00c6@gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Wed, 27 Nov 2019 08:15:43 -0500
Message-ID: <CAGngYiXXugLL7fky4DLUf=xwgem49dNd0YT2Hxj_YoYrcPOOqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] tps6105x add devicetree and leds support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Thu, Nov 21, 2019 at 1:20 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> For both patches:
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Is there anything I can do to help get these into your tree?
The other patches in the set have already been taken by their
respective maintainers.

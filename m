Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32F141824
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 00:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392093AbfFKWaX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 18:30:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45214 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389575AbfFKWaW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 18:30:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id s11so8300945pfm.12
        for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2019 15:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3nJbbRKlTPYM1woarvu6grRc9TzO5KmCP13nZ/PCJ6c=;
        b=AkAgROt9atHwV3xoI9VjaZrzZaaO5howAWh2priY04W1eiUwPse4i9GNmq6QF62bfM
         MjEIEYGjhwP96quM3HMtr3Th7Fkvo1GgNOmUIQgHXmbm147RCQC4UZxj1RlLETex3AUi
         Ks7ioq3D9bjZkjE4COgReB+rkRk03RcrgiW1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3nJbbRKlTPYM1woarvu6grRc9TzO5KmCP13nZ/PCJ6c=;
        b=QUK7wxmcQSsCGTOo+JdbDukRBVFcd6K0/dlPie4z4cU6Y9Pi2NlfTVd4cvrThkTlqC
         t1BupgA6PFBLH4+suNO1X3S/nIlDkObP5mWP19TRWdMQeV1h2Kgec8kjiL2gpLUkOc0d
         kQ38tY9OTzo4K6g6h5c6CYs7cUkeCSij0vVpAfSYAMLaVoMJvA8YQ0G9xGPdGTe6z6aC
         45hzRh9WyCk529I9HialaSAO02Uisb2l5MNL8IaNw0kmEZkLJq5H7hd6bKulc2B2FLtB
         OzuZgxLA5pkU8EvVaHHt8D6Ne9yf5JTUMB53FSkO6dHOf6SqRljipJzMFrmxGvVf21Id
         1Q4g==
X-Gm-Message-State: APjAAAXfDnDlgxWRU6UFzXIoBFhH6gGgI0i55+BOhgsDs0nwGFKTzRMb
        op/598csg7nmDnWWbVkN8Kc2Ew==
X-Google-Smtp-Source: APXvYqzPGqvHJEEW8KGadINzmMV1t9wKDJZxZqs3Q4ilQ1+NwSxiG1GZwT6wk/dEzb5udw5jUepoxQ==
X-Received: by 2002:a17:90a:2488:: with SMTP id i8mr28582703pje.123.1560292222289;
        Tue, 11 Jun 2019 15:30:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id a13sm8937301pgh.6.2019.06.11.15.30.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 15:30:20 -0700 (PDT)
Date:   Tue, 11 Jun 2019 15:30:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Brian Norris <briannorris@google.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Doug Anderson <dianders@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Message-ID: <20190611223019.GH137143@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > This is a long standing flaw in the backlight interfaces. AFAIK generic
> > userspaces end up with a (flawed) heuristic.
> 
> Bingo! Would be nice if we could start to fix this long-standing flaw.

Agreed!

How could a fix look like, a sysfs attribute? Would a boolean value
like 'logarithmic_scale' or 'linear_scale' be enough or could more
granularity be needed?

The new attribute could be optional (it only exists if explicitly
specified by the driver) or be set to a default based on a heuristic
if not specified and be 'fixed' on a case by case basis. The latter
might violate "don't break userspace" though, so I'm not sure it's a
good idea.

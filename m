Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830F956C6D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 16:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfFZOnZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 10:43:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfFZOnZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Jun 2019 10:43:25 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5C1B2080C;
        Wed, 26 Jun 2019 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561560204;
        bh=00rC0wdpAdD7iwooPkJILqIhsMM0FV+mEJjQaxzmaM8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bbLSFe0hmo/BVopnXvLcUiwWWKLYb6WnJZuMmJ0fMJRQnKhfz4iKW+qNz+E4hibsh
         WHkP05nOJLH3js7w+1dbZ1Dz+femBXT6l+JiEcrBqb5/GrEt0TVyaw9lXqrc8u+5QP
         detnyz80PaTcTeuhixV1PgwNOVd5BOJz/jCAKiCE=
Received: by mail-qt1-f169.google.com with SMTP id d23so2649336qto.2;
        Wed, 26 Jun 2019 07:43:23 -0700 (PDT)
X-Gm-Message-State: APjAAAVFjsx6WfYPxS/rGNVqcEpvPWHU217UHv9KUcKZLNDAD/v8sCJ4
        PDDlylafALrV1MQGSzUlfOzHFXgjkOYY6pzijA==
X-Google-Smtp-Source: APXvYqyr8Zlz8fpqgay129UIrkPbfTa84lhlkGKPvEDgHYVRyKeCNl7CMNHQYKrlqQCQGb5m02XxK/OTjfw2ow7sePk=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr4212078qth.136.1561560203223;
 Wed, 26 Jun 2019 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com> <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com> <20190626105614.ujmryi7qou2ra7aq@holly.lan>
In-Reply-To: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 26 Jun 2019 08:43:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL2XXZY-vxb16=6Mh8cV=YaMv0U7d+SHzzgWHwEWFy4Sg@mail.gmail.com>
Message-ID: <CAL_JsqL2XXZY-vxb16=6Mh8cV=YaMv0U7d+SHzzgWHwEWFy4Sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Brian Dodge <bdodge09@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, pbacon@psemi.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jun 26, 2019 at 4:56 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
> > I would like to deprecate the old prefix in the future after communicating
> > with all chip customers, which is why the old prefix is not documented in
> > the new bindings.
>
> Deprecation is fine (by me at least) it's just that I'm not sure that
> removing the documentation for the deprecated bindings is the right way
> to do it. What is the prior art here?

Kind of depends on how widely used something is and we've done both
ways generally. If there are not any upstream dts files, removal is
fine IMO.

With schema, there's a 'deprecated' keyword coming in draft8. So we'll
have a defined way to keep things documented as needed and also warn
about their use.

Rob

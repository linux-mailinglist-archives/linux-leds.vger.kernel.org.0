Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549333460CB
	for <lists+linux-leds@lfdr.de>; Tue, 23 Mar 2021 15:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbhCWOA6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 10:00:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231897AbhCWOAf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Mar 2021 10:00:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99F676199F;
        Tue, 23 Mar 2021 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616508034;
        bh=LDqJyr+BNEHK6b/R2MnFuHdxgjjufjcfn/gh4KM8v7E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FaYnbj1qjsn0MJJ7DERAzrDRxqXerZ63xnjkeUvmsuubQkzuKfjfmk+lZCnElVAQR
         Cu+kevoq0eLOC17Ew0h44V7b1r51Oa1nYOWpSSST1Y0Dsk+QWUUL1yfXH6PpuW9PTp
         Dq+4zFM30jk76hspFv0kWDySzlJLzkBbjUcGA0cr1bDZ0zQkiPFt4C4AjZDPupf96d
         FnJMdTrPVvc3qWwYcs2U77TEX1dDOh7jEK2T0B9FwfUqAvT4wV8xCzcxbzUWpn8WWc
         U3e9SF+FAjtpjFiTNBGQ5hyZBaq67JPVFDbUUcGhda2ueuOd6Oab0VfVzQCPHPjldM
         1dROv0AafWTow==
Received: by mail-ed1-f50.google.com with SMTP id l18so15378651edc.9;
        Tue, 23 Mar 2021 07:00:34 -0700 (PDT)
X-Gm-Message-State: AOAM533x7AxN82o13b6Ug0UzW36QVe1E9j2IpAHYJvo5lEYdbcn4dk1B
        ZcJZa2E62mE+us1uTpNwwC+qh6EkxnbSXjPN/Q==
X-Google-Smtp-Source: ABdhPJzv1cazoF2VbWR8VojgQFPmbKkaJeEOIOWnpGO1bkZgjSKT4zN4b6EtsAHN0qWKTyxBq2qIS4NnZJ5Zod7UdQE=
X-Received: by 2002:a05:6402:5252:: with SMTP id t18mr4877706edd.258.1616508033081;
 Tue, 23 Mar 2021 07:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210322091819.29119-1-chenhui.zhang@axis.com>
 <1616434698.344402.2887754.nullmailer@robh.at.kernel.org> <424d3de97a154c6a9580f27347882413@XBOX01.axis.com>
In-Reply-To: <424d3de97a154c6a9580f27347882413@XBOX01.axis.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Mar 2021 08:00:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYSNBHqdZbWTn76tTna+u=1rjiebTPDQjZFQQdTEkp4w@mail.gmail.com>
Message-ID: <CAL_JsqJYSNBHqdZbWTn76tTna+u=1rjiebTPDQjZFQQdTEkp4w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: leds: Document leds-multi-gpio bindings
To:     Hermes Zhang <Hermes.Zhang@axis.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 22, 2021 at 10:28 PM Hermes Zhang <Hermes.Zhang@axis.com> wrote=
:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 2021=E5=B9=B43=E6=9C=8823=E6=97=A5 1:38
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/leds/leds-multi-
> > gpio.example.dt.yaml: gpios-led: led-states: 'oneOf' conditional failed=
, one
> > must be fixed:
> >       [[0, 1, 2, 3]] is too short
> >       [0, 1, 2, 3] is too long
> >       From schema: /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml
> >
>
> Hi Rob,
>
> Thanks. Yes, now I can see the warning, but I could not understand what w=
as wrong? Could you give some hint?

I think you need 'maxItems' in addition to minItems.

Rob

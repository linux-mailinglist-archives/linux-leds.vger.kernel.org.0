Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC7214730B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jan 2020 22:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAWVUk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jan 2020 16:20:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:33806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728765AbgAWVUk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Jan 2020 16:20:40 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD23822522;
        Thu, 23 Jan 2020 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579814438;
        bh=6bfJPGTweHcN4RE4Nf0sOu2E23jDcC/V8Pnruypva6M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eA1OyuNt7UNNvU1NVydmw8P+6dWizAgxIZPrf92ykUVUmfFD4IHR5NRkLA8gHEXLz
         6CMFuU2BCR3GzWU1nWJkqbzM8U4GAVfG2LHURlRbI2NpIpPrOeJJ72Zk6/K+d5OUY/
         b1KhUwi8Kv20l3WkPSwaymwLy5pvMGndqUTyKqIU=
Received: by mail-qv1-f47.google.com with SMTP id x1so2211427qvr.8;
        Thu, 23 Jan 2020 13:20:38 -0800 (PST)
X-Gm-Message-State: APjAAAWA3xbYrohDTLshNSlkpcEK5NzuutPL6afNjTK+oy20UQqMGHZk
        8slCLY04bkoftcrOoms/liFxNGJ0xVaBgrj2eg==
X-Google-Smtp-Source: APXvYqwfeUA2E65ZlwD9aQLhbra3MaVS5m9PQjYzX/SzG4yx5mpOwnX6H0ROMut79N7HqOydNgvdKOesVUrbMNpMPK0=
X-Received: by 2002:a05:6214:11ac:: with SMTP id u12mr18692605qvv.85.1579814437960;
 Thu, 23 Jan 2020 13:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20200108001738.8209-1-robh@kernel.org> <bec9ab4a-da09-6ef1-7334-d19f11ab2523@gmail.com>
In-Reply-To: <bec9ab4a-da09-6ef1-7334-d19f11ab2523@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 23 Jan 2020 15:20:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bOWJM5nvtY58+2DRtWQNzOPiVX9P===NOk4eBaE5OEA@mail.gmail.com>
Message-ID: <CAL_Jsq+bOWJM5nvtY58+2DRtWQNzOPiVX9P===NOk4eBaE5OEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Convert common LED binding to schema
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jan 8, 2020 at 1:02 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> On 1/8/20 1:17 AM, Rob Herring wrote:
> > Convert the common LEDs properties bindings to a schema. As trigger source
> > providers are different nodes, we need to split trigger source properties
> > to a separate file.
> >
> > Bindings for LED controllers can reference the common schema for the LED
> > child nodes:
> >
> > patternProperties:
> >   "^led@[0-4]":
> >     type: object
> >     allOf:
> >       - $ref: common.yaml#
> >
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Cc: linux-leds@vger.kernel.org
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Jacek, Please take this via led tree
>
> Currently Pavel maintains LED tree. Pavel?

As it doesn't look like there's any conflicts, I've applied this
series to the DT tree.

Rob

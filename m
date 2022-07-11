Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A85701A4
	for <lists+linux-leds@lfdr.de>; Mon, 11 Jul 2022 14:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiGKMHH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Jul 2022 08:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiGKMHG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jul 2022 08:07:06 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B83422C7
        for <linux-leds@vger.kernel.org>; Mon, 11 Jul 2022 05:07:02 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 64so8309482ybt.12
        for <linux-leds@vger.kernel.org>; Mon, 11 Jul 2022 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9/TaxiyiKvNrui4l1nPGDIlfQKIWpJeKr/oIv6jY5g4=;
        b=m6femu7CnL6m4go3tibwbbC1inwqYvHVSSn22DT/h7RKq6qF9EKmRH3DETlWmCPGn8
         cn8pTHEsfxoOux1OYkYOedJGN8RbiteXRNrSBBG+M0no/fvhcRpAOX58wy+DsFdp0PJ3
         JydDc7JRF9HfWUbDLiW8hzd1rLx62+9EoAc/1HID8ALGmq4I0k80JqmR4SJN6A//riV2
         cXpA5Wh8/gmdBvUyKxJREn3/+JXdRMo04HxZk5bwgviKC9Idq4k9jErskkxL1GFH07/G
         SMDrJN44yYGbg/h9Cwlfy7XLvyphnV4VcgNuN76TrfAkch23whM48DXkepHeDk+DH7Ik
         eVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9/TaxiyiKvNrui4l1nPGDIlfQKIWpJeKr/oIv6jY5g4=;
        b=0LFSasf9iU8EMDFp6NA6qD6HkZEroDL9l6oEYgD8wH6vzcm/uXEzWl8yGURB/dpR59
         t/tNyysD0/15afoolS7ljXn00DictIO2V3AXHIYD6x7tex5idSl/aEyW6POk2cs0b9Sd
         yFSExVj10o9OkTpwbwOk9yC4toqh67xHvNlC3RdySmMIE1XIeH73fe8PTq7FFqC+YLph
         RAOG5SuKu4v/UJlxeX/w6bVFB5edKana4b5FR8DzCGw0U5h8OQyznx5+3Iry6OnPueW2
         16S9Vx3AFHM9yMF6Nbrpz9BbjpjMAK+urM7xygMJG8VPjPREGtoMkOYPXMADIVyNelv4
         e9BA==
X-Gm-Message-State: AJIora/f6sWGNgb9QDDXZhESM8eooySQTBjBZn5Zm4bfm3q2GhbILKrZ
        K8S8HMsxZahSJ4EOraNkDnmueDj0VVXkZwhperEaIw==
X-Google-Smtp-Source: AGRyM1vFfv0mkpgaMja8fO3kFoTANu+4p4L9HHgPFinmmZ3C9VB377ZbCYhbLGX3ZsNYWMPb0RclxQjeUvT/PRO6GXI=
X-Received: by 2002:a25:fe04:0:b0:66e:1f8a:8e89 with SMTP id
 k4-20020a25fe04000000b0066e1f8a8e89mr17240379ybe.514.1657541221456; Mon, 11
 Jul 2022 05:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220706112828.27278-1-pali@kernel.org> <20220706162111.GA145516-robh@kernel.org>
 <20220706162335.2eewgf7l3xghdjtr@pali>
In-Reply-To: <20220706162335.2eewgf7l3xghdjtr@pali>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 14:06:50 +0200
Message-ID: <CACRpkdYncdsVW8LysQ3--rOF-KUF6dkkPyX4tg4e10vn2K+8FQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: register-bit-led: Add value property
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 6, 2022 at 6:23 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Wednesday 06 July 2022 10:21:11 Rob Herring wrote:
> > On Wed, Jul 06, 2022 at 01:28:27PM +0200, Pali Roh=C3=A1r wrote:
> > > Allow to define inverted logic (0 - enable LED, 1 - disable LED) via =
value
> > > property. This property name is already used by other syscon drivers,=
 e.g.
> > > syscon-reboot.
> >
> > Yes, but those are potentially multi-bit values. This is a single bit
> > value, and the only value that's ever needed is 0. Why not just use
> > 'active-low' here?
>
> Just because to have uniform definitions across more syscon nodes.

But what happens if he mask and value don't line up?

mask =3D 0x10;
value =3D 0x08;

If you just state active-low; this kind of mistake is not possible to make.

So I'd rather go for active-low;

Yours,
Linus Walleij

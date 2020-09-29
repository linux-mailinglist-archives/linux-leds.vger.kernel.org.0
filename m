Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D111C27CEDC
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 15:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgI2NRV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 09:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbgI2NRV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 09:17:21 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B37C061755
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 06:17:20 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z17so5427320lfi.12
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/BlAqA3/OOlKj4p8f0uAYGcM6Epl7+hojW+mJKuRKGE=;
        b=k1nzMlrxqAL0UFE28jLChRPJ8BlyGVViaekVLd//in5SC4RXlM2SFqC82hfhyzjSDv
         nQyYqr9d8uhYcmf3k5WClaw5sVWbKHIN4C/maEB+7sUMkOcGOoFrsgfW5zTQSf217sO1
         W03ZfBTbTgg+D+nhrbekKk27SHNpOgo5ertLmhSNiWtX0IeoT5RLNrbJGSW0fi12jFzr
         jFvorXOCA0Z3HZa0wHY2UtcoB7OOHFhT6jBzwSCSM7hzLehsAlIJ+AY48lEBlJqKhpBp
         vTCQOjnq5jaTkbHsx1BP8GRDCXdWHSijsctAYixSUj8lU2IiAXnOdDmOhRddwoH1eU5H
         pvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/BlAqA3/OOlKj4p8f0uAYGcM6Epl7+hojW+mJKuRKGE=;
        b=NLTRKifpG2cAGhe+QufW/TDbyz5tMKLReXE7tz+lreFRhQZrqdcVZfK5PtLq3AluKg
         DDtQZQCd6s0mI+OZUJeQqCXqJ4+xNin7BxR7hfPfTSy/HAKjjMFp2yDjC6dEJkfqtqVA
         e/KJolpubYgYP4ONrF1OtZyNZMw/buJTcVeOi4Ie+6zzxX+3zXZz93W1pXzxoflE57kJ
         FA8IXvErSJ/1k5AmuO4PpV9iZfczniWkS5X1dMnH56Ssnhqc8kFfY2fbhEcEAR2zdXJa
         OJwqwo04PeL7pFUHfp+DwIVO1f9pEts24mVEkOmBdXQIsbSNihQFm+tPuC3H1tjtSHfZ
         3mLA==
X-Gm-Message-State: AOAM5314baoZSfPRwESUjBnIeiD91q2okNVC9UWOcG9vA6ZbrWzZbabu
        c9WsJE9seSfTUPSIqG2+ax6jskRXIBZA0hXHhanJ+nlwv8AtlQ==
X-Google-Smtp-Source: ABdhPJxvd7JEQjzOrzEKeCTaZV2e635HDYi2vhwNaap5O+J7CHovWkqSZSPKbIigam+5//dk+SjYhyM/b48SSk95MCk=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1072755lfb.502.1601385438994;
 Tue, 29 Sep 2020 06:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200919180304.2885-1-marek.behun@nic.cz> <20200919180304.2885-9-marek.behun@nic.cz>
In-Reply-To: <20200919180304.2885-9-marek.behun@nic.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:17:07 +0200
Message-ID: <CACRpkdagZH7SDWA1U3ME-eRs88ouD=4AEDhaVS64PX6YY24SKw@mail.gmail.com>
Subject: Re: [PATCH leds v3 8/9] leds: syscon: use struct led_init_data when registering
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 19, 2020 at 8:03 PM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote=
:

> By using struct led_init_data when registering we do not need to parse
> `label` DT property. Moreover `label` is deprecated and if it is not
> present but `color` and `function` are, LED core will compose a name
> from these properties instead.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

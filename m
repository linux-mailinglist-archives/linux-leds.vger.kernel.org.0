Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 445EDE3F5F
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 00:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730931AbfJXWap (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Oct 2019 18:30:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:47060 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731152AbfJXWao (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Oct 2019 18:30:44 -0400
Received: by mail-ot1-f68.google.com with SMTP id 89so398733oth.13
        for <linux-leds@vger.kernel.org>; Thu, 24 Oct 2019 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=gSvK9ktH63OQwALdkKFo/OLG+mLuZb9KZ3yEJyB9bQQ=;
        b=Fzm+vN8Dko8RAxk3DUfICzNk3HCFcJxs0nZuQk7ev8OlYw4fqPDVXnqfciTSg4io3W
         TRasZIlM5Az9j3n6TZcD9eGNrTFtfdfOAiQwJdtLFgboR55z6baBkPHjozxWr5+8sCpD
         BQABfr0X9Hasa7K+/TBGnq99ytA3WQLxk9Oso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gSvK9ktH63OQwALdkKFo/OLG+mLuZb9KZ3yEJyB9bQQ=;
        b=WrILitCFFz6PiLLddW2/nXDFgKvqNF198WM3phn7UPCZeTLjCk8rN42AxObJyCaiKR
         vMqximzE3rS17ef11sj4MP4MXjqW9t4Xqbp9VHl9cRb8MePdmHJOzW4Hfi/0QeVwkjHp
         uNjc+RoaJyvInkUBn+gRiSn0kThCZH08KM5bux0J1lCgu28AJOD2SpuFDC+/a15tpN0T
         No3ez/juKBtNlZVdrVwNpx1LUySDBRbWq5aqQwFiAut6EbLJ15rUMoL+bFnW1ONDFDqN
         vJRcwZBjjGcD6p5P8d1GCCECHchnJpv0I3ks5/rqo+vH0LDB+l8LC5//98/PkTuBgPl/
         t2JA==
X-Gm-Message-State: APjAAAUVPcyeubS7ZWIkFjaaNZ+VsMgcyNZuaQr6KjeeCBNjFkEe/sRC
        Wd5PlruIbVDzogHNDfs7OsphBlmYJNA=
X-Google-Smtp-Source: APXvYqx/+8VPjz1Ev+VPqgwM2xplJR8aJVEjIQQRPHPPON9KmbeFQlOvSczXWQqmOvGD9DlrkztUig==
X-Received: by 2002:a05:6830:1f1a:: with SMTP id u26mr203842otg.134.1571956243598;
        Thu, 24 Oct 2019 15:30:43 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id z3sm116905otk.45.2019.10.24.15.30.42
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 15:30:43 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 83so72796oii.1
        for <linux-leds@vger.kernel.org>; Thu, 24 Oct 2019 15:30:42 -0700 (PDT)
X-Received: by 2002:a54:4e89:: with SMTP id c9mr340053oiy.148.1571956242509;
 Thu, 24 Oct 2019 15:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191024221234.182693-1-ncrews@chromium.org>
In-Reply-To: <20191024221234.182693-1-ncrews@chromium.org>
From:   Nick Crews <ncrews@chromium.org>
Date:   Thu, 24 Oct 2019 16:30:31 -0600
X-Gmail-Original-Message-ID: <CAHX4x84aMMwo+PojwVs+1UDL56ezcAqMdEvCX5udojd=gSkmCQ@mail.gmail.com>
Message-ID: <CAHX4x84aMMwo+PojwVs+1UDL56ezcAqMdEvCX5udojd=gSkmCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: wilco_ec: Add keyboard backlight LED support
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> diff --git a/drivers/platform/chrome/wilco_ec/keyboard_leds.c b/drivers/platform/chrome/wilco_ec/keyboard_leds.c
> new file mode 100644
> index 000000000000..b82ebeced230
> --- /dev/null
> +++ b/drivers/platform/chrome/wilco_ec/keyboard_leds.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Keyboard backlight LED driver for the Wilco Embedded Controller
> + *
> + * Copyright 2019 Google LLC
> + *
> + * Since the EC will never change the backlight level of its own accord,
> + * we don't need to implement a brightness_get() method.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/wilco-ec.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

I just realized a lot of these are unneeded, I removed them in
a v8 I just sent (also whoops, this patch was supposed to have
a v7 title, sorry)

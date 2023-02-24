Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A363B6A207E
	for <lists+linux-leds@lfdr.de>; Fri, 24 Feb 2023 18:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjBXRa0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Feb 2023 12:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBXRaZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Feb 2023 12:30:25 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F67B41B4F;
        Fri, 24 Feb 2023 09:30:24 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id x17so3793295qkp.12;
        Fri, 24 Feb 2023 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2z3BBYqTWmE1dnXYBC4Svuh2U1Y8IsgVYUXDlKnJVc0=;
        b=LhMd5u3bKPl8/xUad1Ltz/OR7oXw5DgmHtp9NPlRtnB/1DecU90psIE7dCY6En4UVi
         wQiyIJC6Q7P/TMVMEgAcnhHCb0BNcmnBvUFmxK3E0jbcaKA5Fe1YNQu2v2co2BVp8SwT
         RfUzFsB2TjHCeY7b93b2dWHy5Qa9BP5EzVCJA1GOaZTYimU2/EqWfs3knBzSTQyKo3qj
         u9Ok9BEmtpdshmU+e9ROterV3EHwX0B/K7xlumHqkSQIhl2YUU4MWBFhYAjDGHcnnMk3
         4XjI/PSnQ6HG/BRKAclm02awLePIW4fR4kQP0XMj3PnV2wVBXiMzrHx0YOs8ZlpG5Owf
         f1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2z3BBYqTWmE1dnXYBC4Svuh2U1Y8IsgVYUXDlKnJVc0=;
        b=X1gCZUHsI88DyAfvxkrNWu8atvphSiQpwZs4FvwZD9K7DiXfzIhLA299iMrTOkKdIR
         9cDOn1+aQTkHmY+hUmZiFr+xsynDjvMVnv5eoSwI0wmW8C1kPrKIaZo1T4p2+x+GsfPQ
         UFSQAz88UsFL+NxTb1V1pu+16/sKjLfYJI0PyZ7GecpCYe/CwzfCBbTBo6D1vLsHyEft
         OU6KBeWp+HQWDTGB9TlFnjJ9RKPsvtO+SMf57Z8FpCaikXkNJIbsZxpCMtGGjQoo16Cz
         8GLMWPeJH4yXVmB2/ocYTwMN1lKlr9ZG92Mv3TVK4ykxJ0Nb4tsCDkKD8pNxaUz7u2UZ
         Ou1Q==
X-Gm-Message-State: AO0yUKW5Hcl3dbDBb+D9UySOZCIedI9I/U/DtXwjc5imrVvqcN4S57fP
        5e4tEOurSiEV4L9i7f/D3ZIEJMsoLIfBWraA/4iV+qVQGxzKrw==
X-Google-Smtp-Source: AK7set8G8Nstyuetzao+ofBiGDimwj7tj8JuQ+Y4Zpzmi6AFzztPJylmXTXN9ZU2q6b1vM+XMBeNQbbngik+5NwYsFE=
X-Received: by 2002:a37:e206:0:b0:724:5da5:1934 with SMTP id
 g6-20020a37e206000000b007245da51934mr2817625qki.10.1677259823601; Fri, 24 Feb
 2023 09:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20230224163741.68656-1-hdegoede@redhat.com>
In-Reply-To: <20230224163741.68656-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Feb 2023 19:29:47 +0200
Message-ID: <CAHp75VeC8necpCPYW=RMak4JVViJtO-GnOC-8Nbw2UGrjB8xgw@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: int3472: Register a LED lookup table entry
 for the privacy LED
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 24, 2023 at 6:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> All currently known models using the tps68470 PMIC have a privacy LED for
> the back sensor (first ACPI consumer dev of the PMIC) connected to the
> ileda output of the PMIC.
>
> Add a LED lookup table entry for this, so that the v4l2-core code turns on
> the LED when streaming from the sensor.

...

>  static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  {

For now and the future improvements you may

    struct device *dev = &client->dev;

>         struct acpi_device *adev = ACPI_COMPANION(&client->dev);

    struct acpi_device *adev = ACPI_COMPANION(dev);

...

> +               ret = skl_int3472_get_sensor_adev_and_name(&client->dev, NULL,
> +                                                          &led_lookup->dev_id);

After above this probably can take only a single line.

> +               if (ret)
> +                       return ret;

...

> +               ret = devm_add_action_or_reset(&client->dev,
> +                                              skl_int3472_tps68470_unregister_led_lookup,
> +                                              led_lookup);

Similar gain.

-- 
With Best Regards,
Andy Shevchenko

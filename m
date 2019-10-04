Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D417CC538
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 23:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfJDVuU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 17:50:20 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46533 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730394AbfJDVuU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 17:50:20 -0400
Received: by mail-lf1-f66.google.com with SMTP id t8so5424679lfc.13
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2019 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8nCCZUN+AQi6f+HDFRHWw58C6Pgy++nWUft00Pny+CA=;
        b=KCSJSGbENpYq7XL5mKWZqt+1XepfFA+fhBaH5bjKTcle4rfGcm0wRn5t5k+9yOtwDd
         naFsp5svX6yrRDahA5xhDeUXzEzCtQ1Dy7gwyX9R3RRJHzHZvpQuk7C/Cm93o93f5VVh
         WiVgh6y8eSA/Klx7Ikn1hA/zh85qNU+X2qSjO8PV+QJFRzlg8E4e1TCLziZujO2QCiLy
         6uYBd3J5VyjD0m+YGYB0M+W7iusmnu2dzS6ipKYaoszu0tlyolWh7Qp1MW74E27ww1/v
         kWF1LYnV0rGo4W4vqS4BzRDYuWqYHeqxdXgNqp0cWRwbGNLcT6ElG611xES/B+SBxZ8f
         8soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nCCZUN+AQi6f+HDFRHWw58C6Pgy++nWUft00Pny+CA=;
        b=Vf3pMGJRAQTl9Gj7DtvH+9VHbFyrXpu/BtSjqdYE+6VUoabMyjGkdp1JKeQVepDfsZ
         ZUhFyqhll8lCLc6wWt082MgsJshDXP+m8MEXHFIiAwIjyf9zOReJ8nWhc6a66bGew/BN
         9q1SwlaV6ZCiQ+3rlVbSINh5Lasmrt+fsxYK7M/XGjoogvNBivy+F9AVZ37eiU6vjZ3S
         iPgo6zn5EgSqk8vs21UPsoEya32y57ObnJD0DrFh5zA1esV7nbRbk9YCYwgwaPdZA70x
         6br5Z0a2HtRd+jgnJ9CIy+UfSGepvo8pifZxr6FddRR+k+TvpmdHdbWNvweX+VXbsZHu
         kDVA==
X-Gm-Message-State: APjAAAWkUIpdY8cgrl+AIVnUTgCqXJ2orRmi4dOQX0obMwDq9wPNFnjO
        uW8MuFeb2I6Ocw9WPMlNbUdLecF7qHfs5D75aBR/eZE5Bc0=
X-Google-Smtp-Source: APXvYqw3KANjP6MBE6jdRbl/rKPm0g8YD9vV2HsqND/p96v/v8xXsNCPpUd92rrbMU93ToBovh+gecB1q607Gmc9d+w=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr10197791lfp.61.1570225817810;
 Fri, 04 Oct 2019 14:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191001145620.11123-1-dmurphy@ti.com> <20191001145620.11123-12-dmurphy@ti.com>
In-Reply-To: <20191001145620.11123-12-dmurphy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:50:06 +0200
Message-ID: <CACRpkdax7jn6UsJOHx2oHpKBpX-5QLMErdZfks-iwTtsYgOUbw@mail.gmail.com>
Subject: Re: [PATCH v10 11/16] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 1, 2019 at 4:56 PM Dan Murphy <dmurphy@ti.com> wrote:

> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Linus Walleij <linus.walleij@linaro.org>

OK I took out the old patch I applied.

Tell me when you feel I should apply this, or if you want
some ACK to take it through another tree.

Yours,
Linus Walleij

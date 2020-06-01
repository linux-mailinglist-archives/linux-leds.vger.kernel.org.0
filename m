Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0CD41EA575
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2020 16:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgFAOBa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jun 2020 10:01:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38914 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAOB3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2020 10:01:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id o9so8257407ljj.6;
        Mon, 01 Jun 2020 07:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RwcvLwY61DL3lLgEQdj5ppo6t6GvndjT1jLRoIUYzkM=;
        b=W43Ta97okiuU8KkuYVls87D54JDzWpLsJLBgjAQm6BlZrLhzHQjGh7ig+uyXahp9qX
         TU3gzfJ7GDMmkX506FJvSrVydMy3IirVXlkJA/VLwcoo3i59IHFYgfO1Ud36Eqig/F44
         jfLpz+oGuXIqp4HyqFhggwkDjWOA2Tj93ZyxhZ7vpnnkAgPnVHfnzAGP12zEIuc28Itt
         bPQfjnZTCpr+VcuMbF53u7hJOVsxcFsbRJtHhsflBplza8WtRLQeHkKarO3WreVaCBYs
         cZ52xYOmzqG1S0ddNuQr9sRA8m9xjw04GbsWglEdJS0YafMzboeq89XV7wRjdMrQRDrK
         yMhg==
X-Gm-Message-State: AOAM532jsXXdw8K8mryeWa1WRES22oZ+uVKNZFHFgaWYM2/HU8BifMP2
        ot/XkQIf1Rx4npOSDAaK4s8=
X-Google-Smtp-Source: ABdhPJxoVj9Ya4G/g3LtoNX72KZKPbSh0F7e6yTrut28wpNPR3kbWdZuWoWGBRXgu2cy9CevfOQxlw==
X-Received: by 2002:a2e:9d52:: with SMTP id y18mr10334393ljj.327.1591020084957;
        Mon, 01 Jun 2020 07:01:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 2sm4072371lji.100.2020.06.01.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:01:24 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jfl09-0003RX-Dd; Mon, 01 Jun 2020 16:01:17 +0200
Date:   Mon, 1 Jun 2020 16:01:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amitoj Kaur Chawla <amitoj1606@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] leds: fix broken devres usage
Message-ID: <20200601140117.GF19480@localhost>
References: <20200601133950.12420-1-johan@kernel.org>
 <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc1JN4yOi5jkMkGj=POqbtXmz+N+Yr9yyhgBnSfQ3YAZg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 01, 2020 at 04:51:01PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 1, 2020 at 4:42 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > Several MFD child drivers register their class devices directly under
> > the parent device (about half of the MFD LED drivers do so).
> >
> > This means you cannot blindly do devres conversions so that
> > deregistration ends up being tied to the parent device, something which
> > leads to use-after-free on driver unbind when the class device is
> > released while still being registered (and, for example, oopses on later
> > parent MFD driver unbind or LED class callbacks, or resource leaks and
> > name clashes on child driver reload).
> 
> Shouldn't MFD take reference count for their children?

That's not the issue here. The child driver is allocating memory for the
class device (for example using devres), and that will end up being
freed on unbind while said device is still registered. The child driver
may then even be unloaded. No extra reference can fix this.

Johan

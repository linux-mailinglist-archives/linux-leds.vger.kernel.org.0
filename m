Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F2F21A957
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 22:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgGIUvR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 16:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgGIUvQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 16:51:16 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7DAC08C5CE;
        Thu,  9 Jul 2020 13:51:16 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m16so108191pls.5;
        Thu, 09 Jul 2020 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6aAUMrDgu/dRMO1PKFcJzl15krQUj9/NrmpmX2igbSU=;
        b=QLAM8adNoWwlxAY3sKExkNjz7ranKdOekEgyi9t/Sjm1NULpynsg98SCvqGKj++2my
         IK6ockcKb2udy/ZF5A5MSGWuMXga8YnRQfwMlegNJLeMokYho+ff0W/PU+kagdruvlXN
         9gkP+eAM5WjaKP96HoniGYjaNKLpDPvFyQT2H1OFmpiP/4SzVsYo3F9vJoOESX7nhgHg
         z1uJVBFWOPaPNtXVby+4aZ67Ytn5WneI4d5WL6X2FVAZoECT+cfFbRB0DPMAY+V7JMGo
         ohQCrGq+5zpYfdb5EivFa/KEV6oa4C/xLRl7xx7z5q04HZE18PRyhet427kCuxzbd+PE
         IBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6aAUMrDgu/dRMO1PKFcJzl15krQUj9/NrmpmX2igbSU=;
        b=ZWHl+OHnnrviZisTXNCcx1BccUg1ffmY1YZn4XV3+zxDoBiLm/fAsmexMITtX9j09+
         e5Xr2IE+07KArNUGlee6XKDVOC/rQw6jocho1zo5SiEhmBkZ/qicrpox/T6Uaa/2q2vd
         pf/aTaLRUvxoT9yCufCjVpDcdTecaoieP+EMf9I/gyXXZ/m+culCsHrACAMweTv71QLS
         PkkqYa05RREOCNXdrdvAO8WSlI2A6JoPvViU5EpP1+SMMTRqXNRvx4TdA3fFn2EeT56c
         p4vP5p4SKEc37YvuP0TLDcYRiL90ktO+VRnv2ueP59IP/5CHhdSZRk0GGMbrQkTIHpp9
         bBOQ==
X-Gm-Message-State: AOAM530UOZHZrlWBV+DG7rCMbvBRB73HsUvRRXf/ZXwa8wqAwnXWyP4E
        4sJPtgNzWDhnP7Yxh+Hiqwm0ZCTbHuyUZH4Gpxe5gidE
X-Google-Smtp-Source: ABdhPJxsjKxantzTRftMX6bNh0Ka3ytqBm/pi7VsMJfjHY2qg0YOKAp3gqWXkrp8PGXSVI7piz191sxizMiURXgpxig=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr47735913plo.262.1594327876126;
 Thu, 09 Jul 2020 13:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200709201220.13736-1-eajames@linux.ibm.com> <20200709201220.13736-3-eajames@linux.ibm.com>
In-Reply-To: <20200709201220.13736-3-eajames@linux.ibm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 23:50:59 +0300
Message-ID: <CAHp75VcE9skpqa32bZ4AAcOa08WYSqqZodnveLSF+sZej5KnWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: pca955x: Add an IBM software implementation of
 the PCA9552 chip
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        vishwa@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 9, 2020 at 11:16 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> IBM created an implementation of the PCA9552 on a PIC16F
> microcontroller. The I2C device addresses are different from the
> hardware PCA9552, so add a new compatible string and associated
> platform data to be able to probe this device.

This is weird. I would rather expect ibm prefix with corresponding part number.

> +       pca9552_ibm,

> +       [pca9552_ibm] = {

> +       { "pca9552-ibm", pca9552_ibm },

> +       { .compatible = "nxp,pca9552-ibm", .data = (void *)pca9552_ibm },


-- 
With Best Regards,
Andy Shevchenko

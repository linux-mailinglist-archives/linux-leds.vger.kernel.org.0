Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27967B16E5
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 02:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfIMAfC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 20:35:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41562 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIMAfC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 20:35:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so14329500pgg.8;
        Thu, 12 Sep 2019 17:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w9Eu3Nio2Js5QoCSmznbOdWh3AI8fmPPlhUEes+eFAA=;
        b=T7drNqaHomDnYMgCKPe2fWtTF8KUjSO7W5LoCyFv/br83VFsPfRH9IActJbNNhWUSr
         eZPoOSZPynxac+hNjzcG3snjNnGDs7SYu+YuR54cLP+K/X+RlytyhXsHgMR7g6SYo6Aw
         BgEHqvfoKJKbsn98NytP4ekDg781UhEES6eqAAHfXDCPZ+aQPXMquyA3m/O2XdQ7OGFR
         FI166ptaS/HPjE8TFUrdGm5AuVSMCeMKn15igtUqb5RowBX+K2rmZhb94MFJtgvZBegE
         y13+ifHy0GJ19X16f1ZwBMYBrmyeB6258hpXynuAPd36WkwiRIHwJf+OVR+7saYMUP+A
         k/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w9Eu3Nio2Js5QoCSmznbOdWh3AI8fmPPlhUEes+eFAA=;
        b=bEk3ViaaJjCNM4alNw3CpW2AqLNCbCill8LiHlvVUTtE48FH9TTVBoQIiAeCYMQ9tz
         kMLOMQCFxdF4AuZb7NsmHSQhBBR9aARpS5L2zDsNHIBuCWOPdM+aY16syJXaCtAblJ6A
         UOh2Z83ZwY/qcbgS5BBtbulbTlkapy+Gmd7OVLNWzI1kHI50hNE9sUIz/k++1174HqWd
         uFu824hPBr6UVnwkxyeJJ08mrRJF3gHNe88Y3lweo8SxUgeorSb/PFh2i4fR0iQLBhSn
         +IbTSOrL/y4vs9kt0/qsywVnqO//501zWXz639kH2SZI070/qQ5l+BxMbEyBi6PTp+VU
         aarg==
X-Gm-Message-State: APjAAAXCLxYhPpqhCM1PQJ+1ZVr8Obtf+2kbIQUVjj0YgtFP6UfkzL8S
        29PP27jTe0scTLfnFsmWwq5F2S9BvEIb5C+8s4k=
X-Google-Smtp-Source: APXvYqxXjm1ZbRgrsjvoA6z/XvK3thN8414BxXtIYRUlh2aWuM5j/4DnzWXfjKJIj4CtXOhItCp6bFxOexrCiTrwb90=
X-Received: by 2002:a17:90a:2385:: with SMTP id g5mr1724585pje.124.1568334899945;
 Thu, 12 Sep 2019 17:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <1568299189-11074-1-git-send-email-akinobu.mita@gmail.com>
 <1568299189-11074-2-git-send-email-akinobu.mita@gmail.com> <296db773-2185-9a5e-c9e6-df614092a969@gmail.com>
In-Reply-To: <296db773-2185-9a5e-c9e6-df614092a969@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Fri, 13 Sep 2019 09:34:49 +0900
Message-ID: <CAC5umygmcVwbksX3t2bgvvcSztaeAw9MnEj_=HgZK+C8Wc5_NA@mail.gmail.com>
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B49=E6=9C=8813=E6=97=A5(=E9=87=91) 2:15 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> Hi Akinobu,
>
> Please bump patch version each time you send an update
> of the patch with the same subject.

Oops, should I resend with the correct subject?

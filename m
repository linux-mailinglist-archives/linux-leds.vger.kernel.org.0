Return-Path: <linux-leds+bounces-5829-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E7BF2D89
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 20:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DF524E6264
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607C9285CB9;
	Mon, 20 Oct 2025 18:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq9mmExE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E40221DB5
	for <linux-leds@vger.kernel.org>; Mon, 20 Oct 2025 18:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983255; cv=none; b=ZmEgcV4n1IbRJ7WWbmp1uIpV9G/xz39mzvJmFJtRzsYWiS/zqk+J3XWsgIhAYVWZweac44HtAVyezutlzotwxzgTFjbG3Rki+ESMAC0OEGSB8MigkgxRcRUlJaCniYdEIwcJDY/1ab987y8cjXnZp8GwP8ni6aQH12JeibMzUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983255; c=relaxed/simple;
	bh=+ouTqeK8KjHhGyZubwi3mpbqQWmjMmEjydzA19keOOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VLAmOImG9GwBAjn91p8aiR1efBJqKbwHUMiPsCAl7/afKh84W9V4pflVFKgeqzRgI2F1KiDkVVkMGGK5dIDaIXBlNlhInpJbKD/CGqh3lb12JatDataA2maYNmMRuiEr7euOVscyWitg4j0EvJiefi3rS912OIN3CknATfIQAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq9mmExE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781206cce18so4740673b3a.0
        for <linux-leds@vger.kernel.org>; Mon, 20 Oct 2025 11:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983253; x=1761588053; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ouTqeK8KjHhGyZubwi3mpbqQWmjMmEjydzA19keOOA=;
        b=Oq9mmExEZL4ZdA7i7UXfvwZ6w+EwAAFEGa3w34rikHgKESzAOKzYEpVfQletv96uwG
         E9RsoCtDqfrzO5mdrR7wqeonFrtzPKzzt0Q3EazJSPfRk/u/Ow4KwzGv0kNhGB57Z1H/
         mW3lt5s6MYYRWenEs34RCTv34itJorycykLcuyWrLYQfTeRqpH8mCsStsUSxvkmG631w
         Sc+re2UbLOWG/uQUzq+MOdqoTns4vXJIBeE1/KhE17bsnmBaisa19OPqfk1geZupuv0J
         kRNncSB7pcj7jvjNtrnalM4WPjP5k+WjNIGdWVsaSfgOpGq0fe/+03nHMOjQ4yJfpC/I
         /O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983253; x=1761588053;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ouTqeK8KjHhGyZubwi3mpbqQWmjMmEjydzA19keOOA=;
        b=vSOryQBXKEzoyFWz8lD9tbEAO3q/TKfu1wtXkUG9URNpgSpN0dZpYMWFUjXNJ3g1B3
         1kIVgf4eHwfYWxGMh2MaXeSY3OnU+2FdEbRUs9e2IxACRi8JZckAncUy/o7oHrR5vMUb
         coatAEKvm5F1RmhWbfXstYswe+752aoYnAU/MwrrtImf+eEiq6iY16asMHFec7hX/yQv
         nfH4EvhIbzGpH8SDtoqOtzxizMa4vaotGRr9iKe86YOhQckl2Dwgj2FHN832bmg56h5U
         RdmLdCAPMSJh9XOWsgimlYOdYqWHAnTWtXm2cSDXYpZzzXXrAxKTM/LEMbYAoKmm4Smg
         X8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUr7ATT1r5qE/M0qFibnCllq3YUqpFcavIMWXkrvsQZngKw5FYHUOs2/n64AXvCq1mtZ2HtC68aR+tr@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyLu+mCEHgn7rGl04ii1dj2V17SOMkTTW1a6sbnYKxbdsSZX0
	h6VnyoxBGgK11YACgAG9J6NzaTP6bariGTklwm220lVEEqV+nBvUMLkh
X-Gm-Gg: ASbGncsMHWl1UqkLKy2rI0INTqkKmegE+Y283TamXm6zX2qC56zGlCv58po8A3Oiqtb
	xSK9sSS8ujmBYwzxsaexLBizp7oYS9uvdYRKhvifj0gJcwH7FdyXjgePWSy0m2bpmkXHTjLe4hm
	N4dpksRnnfxYt1k8medn+/hyYL4USTZSBtFiwxQzWbh0I67ZqBcrceSRT9EHdDcwDj5Wul73qEq
	P9A04ecCbrBQ/Q63K5ccDTfrWoYTsTSBpHdvQNfrgR7VWjjCGTR1el7P7mR0ZnHXvr9RWb68yA2
	l5dD6XJ1jKOiRzus/7XVZEs4+MVtJkun3TJszwu4PKJGUgGERQ+6IST4IyPP6h+FIS0xrggwEAz
	p6EXjyh0kjnMss4/Yc9B25VJCS/ax7+SdzS83jCTOjlGRsufJn9Lzr//t7cjr6qdJKK8j0tHaBE
	UGs919AEzPO7CZa5bC4wQ/GWYsfvJbsIuN1+PumDikW+LQXw/VOWW8rc5nabWGUxMW9csl8AA=
X-Google-Smtp-Source: AGHT+IFyEI5povAc8sFYaguQEVG54DJVwm3UpywxXfyVqK9JFR92iJ+L7mTz5exo3Mj/xjg9HqAs9Q==
X-Received: by 2002:a05:6a00:1393:b0:784:27cb:a2c6 with SMTP id d2e1a72fcca58-7a210d899c8mr20387861b3a.2.1760983252776;
        Mon, 20 Oct 2025 11:00:52 -0700 (PDT)
Received: from TY4PR01MB17309.jpnprd01.prod.outlook.com ([2603:1046:c09:20a6::5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230122380sm8855641b3a.77.2025.10.20.11.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:00:52 -0700 (PDT)
From: jonathan brophy <professorjonny98@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jonathan Brophy <Professor_jonny@hotmail.com>, Pavel Machek
	<pavel@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, lee Jones
	<lee@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: Add virtualcolor group dt
 bindings documentation.
Thread-Topic: [PATCH v3 2/4] dt-bindings: leds: Add virtualcolor group dt
 bindings documentation.
Thread-Index: AQHcQOxnIJ58J1ZGPEecG/r284d6fbTK6VoAgABojfM=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 20 Oct 2025 18:00:47 +0000
Message-ID:
	<TY4PR01MB17309CB1B7797B52FF031A27EF0F5A@TY4PR01MB17309.jpnprd01.prod.outlook.com>
References: <20251019092331.49531-1-professorjonny98@gmail.com>
 <20251019092331.49531-3-professorjonny98@gmail.com>
 <176096011281.22748.15975544575193365055.robh@kernel.org>
In-Reply-To: <176096011281.22748.15975544575193365055.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

=0A=
=0A=
=0A=
On Sun, 21 October 2025 12:35 AM, JRob Herring (Arm) wrote:=0A=
>=0A=
>=0A=
>On Sun, 19 Oct 2025 22:23:25 +1300, Jonathan Brophy wrote:>=0A=
>=0A=
> From: Jonathan Brophy <professor_jonny@hotmail.com>=0A=
>=0A=
>=0A=
>=0A=
>> Add device tree binding documentation for the virtual LED group driver=
=0A=
>>=0A=
>> that implements virtual LED groups by aggregating multiple monochromatic=
=0A=
>>=0A=
>> LEDs=0A=
>>=0A=
>>=0A=
>=0A=
>> Bindings for the virtual driver are not describing hardware LEDs they=0A=
>=0A=
>> describe virtual devices made from groups of hardware LEDs created from =
an array=0A=
>=0A=
>> of LED phandles.=0A=
>=0A=
>=0A=
>=0A=
>> Normally the device tree is used to describe hardware not virtual hardwa=
re=0A=
>=0A=
>> but it is particularly useful in situations where you require an LED to =
be a=0A=
>=0A=
>> specific color by mixing primary colors, such as multi element multi col=
or LEDs=0A=
>=0A=
>> to be operated from a device tree binding.=0A=
>=0A=
>=0A=
>> It also becomes useful with multiple LEDs operating the same indicator s=
uch as=0A=
>=0A=
>> ring of light indicators where the LEDs are driven From different GPIO o=
utputs=0A=
>=0A=
>> unifying the control that can give basic indication during system startu=
p,=0A=
>=0A=
>> shutdown upgrade etc...=0A=
>=0A=
>>=0A=
>=0A=
>> co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0A=
>=0A=
>> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0A=
>=0A=
>> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>=0A=
>=0A=
>> ---=0A=
>=0A=
>>=A0 .../leds/leds-group-virtualcolor.yaml=A0=A0=A0=A0=A0=A0=A0=A0 | 110 +=
+++++++++++++++++=0A=
>=0A=
>>=A0 1 file changed, 110 insertions(+)=0A=
>=0A=
>>=A0 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-=
virtualcolor.yaml=0A=
>=0A=
>=0A=
>My bot found errors running 'make dt_binding_check' on your patch:=0A=
>=0A=
>=0A=
>=0A=
>yamllint warnings/errors:=0A=
>=0A=
>=0A=
>=0A=
>dtschema/dtc warnings/errors:=0A=
>=0A=
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/le=
ds/leds-group-virtualcolor.example.dtb: pwm-led->controller (pwm-leds): led=
-1: 'max-brightness' is a required property=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0 from schema $id: http://devicetree.org/schemas/leds/led=
s-pwm.yaml#=0A=
>=0A=
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/le=
ds/leds-group-virtualcolor.example.dtb: pwm-led->controller (pwm-leds): led=
-2: 'max-brightness' is a required property=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0 from schema $id: http://devicetree.org/schemas/leds/led=
s-pwm.yaml#=0A=
>=0A=
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/le=
ds/leds-group-virtualcolor.example.dtb: pwm-led->controller (pwm-leds): led=
-3: 'max-brightness' is a required property=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0 from schema $id: http://devicetree.org/schemas/leds/led=
s-pwm.yaml#=0A=
>=0A=
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/le=
ds/leds-group-virtualcolor.example.dtb: pwm-led->controller (pwm-leds): led=
-4: 'max-brightness' is a required property=0A=
>=0A=
>=A0=A0=A0=A0=A0 from schema $id: http://devicetree.org/schemas/leds/leds-p=
wm.yaml#=0A=
>=0A=
=0A=
sorry this was me checking my yaml's without validating the whole structure=
 as those are covered by their own Yaml's=0A=
In futurre I will validate the whole structure.=

